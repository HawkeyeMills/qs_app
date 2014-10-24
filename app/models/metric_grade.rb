class MetricGrade < ActiveRecord::Base
	has_many :grades
	has_many :metrics

	def MetricGrade.calcStandard(metricConfigID, metricId, gcid, metrics)
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
		mg_points = 0

		# do biz logic
		if m_value.to_i == ''
			mg_points = mg_points
			logger.info("1 POINTS = #{mg_points}")
		elsif m_value >= gc_goal.to_i
			mg_points = gc_weight
			logger.info("2 POINTS = #{mg_points}")
		elsif m_value < gc_goal.to_i
			mg_points = (m_value.to_f/gc_goal.to_f)
			logger.info("3 POINTS = #{m_value.to_f}")
			logger.info("3 POINTS = #{gc_goal.to_f}")
			logger.info("3 POINTS = #{gc_weight.to_f}")
			logger.info("3 POINTS = #{mg_points}")
		end

		# get metric_grade.percentage
		mg_percentvalue = mg_points / gc_weight
		mg_percentage = mg_percentvalue * 100
		logger.info("mg_percentage = #{mg_percentage}")

		g_gradeid = nil

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

		# insert or update gradeId, metricId, points, percentage into metricgrades
    	connection = MetricGrade.connection
      	table_name = :metric_grades
      	upsert = Upsert.new(connection, table_name)
		upsert.row({:metric_id => metricId}, :grade_id => g_gradeid, :points => mg_points, :percentage => mg_percentage, :created_at => Time.now, :updated_at => Time.now)
	end

	def MetricGrade.calcWeight(metricConfigID, metricId, gcid, metrics, user)
		logger.info (" calcWeight!!!!" )
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
		m_date = metrics.find(metricId).metricdate
		logger.info ("m_date = #{m_date}")
		m_yesterday = m_date.to_date - 1
		logger.info ("m_yesterday = #{m_yesterday}")
		m_yesterdayObj = Metric.where(metric_config_id: metricConfigID, metricdate: m_yesterday).first
		logger.info ("m_yesterdayObj = #{m_yesterdayObj}")
		m_yesterdayValue = m_yesterdayObj.value
		logger.info ("m_yesterdayValue = #{m_yesterdayValue}")

		# initialize mg_points (metric grade points = outPoints)
		mg_points = 0

		# do biz logic
		if m_value >= m_yesterdayValue
			mg_points = mg_points
			logger.info("1 POINTS = #{mg_points}")
		elsif m_value < m_yesterdayValue
			mg_points = gc_weight
			logger.info("2 POINTS = #{mg_points}")
		else
			mg_points = 0
			logger.info("NEVER HERE = #{m_value.to_f}")
		end

		# get metric_grade.percentage
		mg_percentvalue = mg_points / gc_weight
		mg_percentage = mg_percentvalue * 100
		logger.info("mg_percentage = #{mg_percentage}")

		g_gradeid = nil

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
				g_gradeid = grade.id
			end
		end

		# insert or update gradeId, metricId, points, percentage into metricgrades
    	connection = MetricGrade.connection
      	table_name = :metric_grades
      	upsert = Upsert.new(connection, table_name)
		upsert.row({:metric_id => metricId}, :grade_id => g_gradeid, :points => mg_points, :percentage => mg_percentage, :created_at => Time.now, :updated_at => Time.now)
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

		g_gradeid = nil

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

		# insert or update gradeId, metricId, points, percentage into metricgrades
    	connection = MetricGrade.connection
      	table_name = :metric_grades
      	upsert = Upsert.new(connection, table_name)
		upsert.row({:metric_id => metricId}, :grade_id => g_gradeid, :points => mg_points, :percentage => mg_percentage, :created_at => Time.now, :updated_at => Time.now)
	end
end
