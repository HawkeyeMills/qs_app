class DailyGrade < ActiveRecord::Base
	has_many :grades

	def DailyGrade.calculate(calcdate, metrics)

		gc_sum = GradeConfig.sum("weight")
		#logger.info ("gc_sum = #{gc_sum}")
		metricids = metrics.map{|h| h.id }
		metricids = metricids.to_s.tr('[]', '')
		#logger.info ("metricids = #{metricids}")
		metricgrades = MetricGrade.where("metric_id in (#{metricids})")
		mg_sum = metricgrades.sum("points")
		#logger.info ("mg_sum = #{mg_sum}")

		gradePercentage = (mg_sum/gc_sum) * 100

		g_gradeid = nil

		# get grade.grade_id
		grades = Grade.all
		grades.each do |grade|
			grademin = grade.minrange
			##logger.info("grademin = #{grademin}")
			grademax = grade.maxrange
			##logger.info("grademax = #{grademax}")
			if gradePercentage.to_f <= grademax.to_f and gradePercentage.to_f > grademin.to_f
				gradeval = grade.gradevalue
				#logger.info("GRADE = #{gradeval}")
				g_gradeid = grade.id
			elsif gradePercentage.to_f == 0
				gradeval = "F"
				g_gradeid grade.where(value = "F").pluck(:id)
			end
		end
		# insert or update gradeId, metricId, points, percentage into metricgrades
    	connection = DailyGrade.connection
      	table_name = :daily_grades
      	upsert = Upsert.new(connection, table_name)
		upsert.row({:gradeDate => calcdate}, :grade_id => g_gradeid, :points => mg_sum, :possible => gc_sum, :created_at => Time.now, :updated_at => Time.now)	
	end

	def DailyGrade.getGrade(dateToGrade)
		dailygradeid = DailyGrade.where(gradeDate: dateToGrade).pluck(:grade_id)
		gradevalue = nil		
		logger.info("dailygradeid = #{dailygradeid}")
		if dailygradeid.count > 0
			dailygradeid.each do |id|
				return gradevalue = Grade.find(id).gradevalue
				logger.info("------------------------------->gradevalue = #{gradevalue}")
			end
		else
			return gradevalue = nil
		end
	end

end
