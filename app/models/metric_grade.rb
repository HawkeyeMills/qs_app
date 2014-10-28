class MetricGrade < ActiveRecord::Base
	has_many :grades
	has_many :metrics

	def MetricGrade.calcStandard(metricConfigID, st_metricId, gcid, metrics)
		logger.info (" calcStandard!!!!" )
		st_gradeval = 0
		@grade_configs = GradeConfig.all
		# get grade_config.goal based on metricConfigID
		st_gc_row = @grade_configs.find_by metric_config_id: metricConfigID
		st_gc_goal = st_gc_row.goal
		logger.info("st_gc_goal = #{st_gc_goal}")
		st_gc_weight = st_gc_row.weight
		logger.info("st_gc_weight = #{st_gc_weight}")
		# get metric.value st_m_value from metric.id
		st_m_value = metrics.find(st_metricId).value
		logger.info ("st_m_value = #{st_m_value}")

		# initialize st_mg_points (metric grade points = outPoints)
		st_mg_points = 0

		# do biz logic
		if st_m_value.to_i == ''
			st_mg_points = st_mg_points
			logger.info("1 POINTS = #{st_mg_points}")
		elsif st_m_value >= st_gc_goal.to_i
			st_mg_points = st_gc_weight
			logger.info("2 POINTS = #{st_mg_points}")
		elsif st_m_value < st_gc_goal.to_i
			st_mg_points = (st_m_value.to_f/st_gc_goal.to_f)
			logger.info("3 POINTS = #{st_m_value.to_f}")
			logger.info("3 POINTS = #{st_gc_goal.to_f}")
			logger.info("3 POINTS = #{st_gc_weight.to_f}")
			logger.info("3 POINTS = #{st_mg_points}")
		end

		# get metric_grade.percentage
		st_mg_percentvalue = st_mg_points / st_gc_weight
		st_mg_percentage = st_mg_percentvalue * 100
		logger.info("st_mg_percentage = #{st_mg_percentage}")

		st_g_gradeid = 0

		# get st_grade.grade_id
		st_grades = Grade.all
		st_grades.each do |st_grade|
			st_grademin = st_grade.minrange
			#logger.info("grademin = #{grademin}")
			st_grademax = st_grade.maxrange
			#logger.info("grademax = #{grademax}")
			if st_mg_percentage.to_f <= st_grademax.to_f and st_mg_percentage.to_f > st_grademin.to_f
				st_gradeval = st_grade.gradevalue
				st_g_gradeid = st_grade.id
			elsif st_mg_percentage.to_f == 0
				st_gradevalrow = st_grades.find_by gradevalue: "F"
				st_gradeval = st_gradevalrow.gradevalue
				st_g_gradeid = st_gradevalrow.id
				logger.info("st_g_gradeid = #{st_g_gradeid}")
			end
		end
		
		logger.info("GRADE standardcalc = #{st_gradeval} and gradeid = #{st_g_gradeid}")
		# insert or update gradeId, metricId, points, percentage into metricst_grades
    	st_connection = MetricGrade.connection
    	logger.info("got here")
      	st_table_name = :metric_grades
      	logger.info("got here 2")
      	st_upsert = Upsert.new(st_connection, st_table_name)
      	logger.info("got here 3")
		st_upsert.row({:metric_id => st_metricId}, :grade_id => st_g_gradeid, :points => st_mg_points, :percentage => st_mg_percentage, :created_at => Time.now, :updated_at => Time.now)
	end

	def MetricGrade.calcWeight(metricConfigID, weight_metricId, gcid, metrics, user)
		logger.info (" calcWeight!!!!" )
		@grade_configs = GradeConfig.all
		# get grade_config.goal based on metricConfigID
		gc_row = @grade_configs.find_by metric_config_id: metricConfigID
		gc_goal = gc_row.goal
		logger.info("gc_goal = #{gc_goal}")
		gc_weight = gc_row.weight
		logger.info("gc_weight = #{gc_weight}")
		# get metric.value m_value from metric.id
		m_value = metrics.find(weight_metricId).value
		logger.info ("m_value = #{m_value}")
		m_date = metrics.find(weight_metricId).metricdate
		logger.info ("m_date = #{m_date}")
		m_yesterday = m_date.to_date - 1
		logger.info ("m_yesterday = #{m_yesterday}")
		m_yesterdayObj = Metric.where(metric_config_id: metricConfigID, metricdate: m_yesterday).first
		logger.info ("m_yesterdayObj = #{m_yesterdayObj}")
		m_yesterdayValue = m_yesterdayObj.value
		logger.info ("m_yesterdayValue = #{m_yesterdayValue}")

		# initialize weight_mg_points (metric grade points = outPoints)
		weight_mg_points = 0

		# do biz logic
		if m_value >= m_yesterdayValue
			weight_mg_points = weight_mg_points
			logger.info("1 POINTS = #{weight_mg_points}")
		elsif m_value < m_yesterdayValue
			weight_mg_points = gc_weight
			logger.info("2 POINTS = #{weight_mg_points}")
		else
			weight_mg_points
			logger.info("NEVER HERE = #{m_value.to_f}")
		end

		# get metric_grade.percentage
		mg_percentvalue = weight_mg_points / gc_weight
		weight_mg_percentage = mg_percentvalue * 100
		logger.info("weight_mg_percentage = #{weight_mg_percentage}")

		weight_g_gradeid = 0
		gradeval = 0

		# get grade.grade_id
		grades = Grade.all
		grades.each do |grade|
			grademin = grade.minrange
			logger.info("grademin = #{grademin}")
			grademax = grade.maxrange
			logger.info("grademax = #{grademax}")
			if weight_mg_percentage.to_f <= grademax.to_f and weight_mg_percentage.to_f > grademin.to_f
				gradeval = grade.gradevalue
				logger.info("GRADE = #{gradeval}")
				weight_g_gradeid = grade.id
			elsif weight_mg_percentage.to_f == 0
				gradeval = "F"
				weight_g_gradeid = grade.id
			end
		end
		
		logger.info("GRADE weight calc = #{gradeval} and gradeid = #{weight_g_gradeid}")
		# insert or update gradeId, weight_metricId, points, percentage into metricgrades
    	connection = MetricGrade.connection
      	table_name = :metric_grades
      	upsert = Upsert.new(connection, table_name)
		upsert.row({:metric_id => weight_metricId}, :grade_id => weight_g_gradeid, :points => weight_mg_points, :percentage => weight_mg_percentage, :created_at => Time.now, :updated_at => Time.now)
	end

	def MetricGrade.calcDeclining(metricConfigID, metricId, gcid, metrics)
		#used primarily for workout duration
		#goal in grade_configs stored like 00:30:00
		#value in metrics stored like - NEED TO GET WORKOUT DURATION ADDED
		logger.info (" calcStandard!!!!" )
		@grade_configs = GradeConfig.all
		# get grade_config.goal based on metricConfigID
		gc_row = @grade_configs.find_by metric_config_id: metricConfigID
		gc_goal = gc_row.goal
		logger.info("gc_goal = #{gc_goal}")
		gc_weight = gc_row.weight
		logger.info("gc_weight = #{gc_weight}")
		# get metric.value m_value from metric.id
		m_value = metrics.find(metricId).value
		logger.info ("m_value = #{m_value}")

		# initialize mg_points (metric grade points = outPoints)
		mg_points = gc_weight

		# do biz logic
		if m_value.to_i == ''
			mg_points = mg_points
			logger.info("1 POINTS = #{mg_points}")
		elsif m_value <= gc_goal.to_i
			mg_points = gc_weight
			logger.info("2 POINTS = #{mg_points}")
		else
			mg_points = (gc_goal.to_f/m_value.to_f)*gc_weight.to_f
			logger.info("3 POINTS = #{m_value.to_f}")
			logger.info("3 POINTS = #{gc_goal.to_f}")
			logger.info("3 POINTS = #{gc_weight.to_f}")
			logger.info("3 POINTS = #{mg_points}")
		end

		# get metric_grade.percentage
		mg_percentvalue = mg_points / gc_weight
		mg_percentage = mg_percentvalue * 100
		logger.info("mg_percentage = #{mg_percentage}")

		g_gradeid = 0
		gradeval = 0

		# get grade.grade_id
		grades = Grade.all
		grades.each do |grade|
			grademin = grade.minrange
			logger.info("grademin = #{grademin}")
			grademax = grade.maxrange
			logger.info("grademax = #{grademax}")
			if mg_percentage.to_f <= grademax.to_f and mg_percentage.to_f > grademin.to_f
				gradeval = grade.gradevalue
				logger.info("GRADE = #{gradeval}")
				g_gradeid = grade.id
			elsif mg_percentage.to_f == 0
				gradeval = "F"
				g_gradeid = grade.gradevalue == "F"
			end
		end

		logger.info("GRADE calc declining = #{gradeval} and gradeid = #{g_gradeid}")
		# insert or update gradeId, metricId, points, percentage into metricgrades
    	connection = MetricGrade.connection
      	table_name = :metric_grades
      	upsert = Upsert.new(connection, table_name)
		upsert.row({:metric_id => metricId}, :grade_id => g_gradeid, :points => mg_points, :percentage => mg_percentage, :created_at => Time.now, :updated_at => Time.now)
	end
end
