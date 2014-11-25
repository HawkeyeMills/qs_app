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
		#logger.info("dailygradeid = #{dailygradeid}")
		if dailygradeid.count > 0
			dailygradeid.each do |id|
				return gradevalue = Grade.find(id).gradevalue
				#logger.info("------------------------------->gradevalue = #{gradevalue}")
			end
		else
			return gradevalue = nil
		end
	end
	
	def DailyGrade.getPoints(dateToGrade)
		obj_dailygrade = DailyGrade.find_by_gradeDate(dateToGrade)
		points = nil
		if(obj_dailygrade != nil)
			return points = obj_dailygrade.points
		else
			return points = nil
		end
	end

	def DailyGrade.getPointsPossible(dateToGrade)
		obj_dailygrade = DailyGrade.find_by_gradeDate(dateToGrade)
		possible = nil
		if(obj_dailygrade != nil)
			return possible = obj_dailygrade.possible
		else
			return possible = nil
		end
	end

	def DailyGrade.refreshAll
        @metricsToShow = Metrics.all
        @gradeconfigs = GradeConfig.all
        @gradecalcs = GradeCalc.all
        @metricconfigs = current_user.metric_configs
        @metricsToShow.each do |metric|
          mv = metric.value
          mid = metric.id
          #logger.info("metric.metric_config_id = #{metric.metric_config_id}")
          objMC = @metricconfigs.find(metric.metric_config_id).id
          #logger.info ("objMC ----------------------------> #{metric.metric_config_id}")
          #gcid = GradeConfig.all.find(metric.metric_config_id)
          #logger.info ("gcid ----------------------------> #{gcid}")
          
          grade_config_id = @gradeconfigs.where(metric_config_id: metric.metric_config_id).pluck(:grade_calc_id)
          
          #logger.info ("grade_config_id ----------------------------> #{grade_config_id}")
          #@objGC = @metricconfigs.find(gradeconfig.metric_config_id).grade_calc_id
          if grade_config_id.count > 0
            grade_config_id.each do |gcid|
              calc = @gradecalcs.find(gcid).gradecalc

              #logger.info (" -------------------------->Calc for #{objMC} =  #{calc}" )
              #logger.info (" -------------------------->metric.metric_config_id =  #{metric.metric_config_id}" )
              #logger.info (" -------------------------->mid =  #{mid}" )
              #logger.info (" -------------------------->gcid =  #{gcid}" )

              if calc == 'standard'
                MetricGrade.calcStandard(metric.metric_config_id, mid, gcid, @metricsToShow)
              elsif calc == 'weight'
                MetricGrade.calcWeight(metric.metric_config_id, mid, gcid, @metricsToShow, @users)
              elsif calc == 'dbtc'
                #Standard works for DBTC calcs also
                MetricGrade.calcStandard(metric.metric_config_id, mid, gcid, @metricsToShow)
              elsif calc == 'declining'
                MetricGrade.calcDeclining(metric.metric_config_id, mid, gcid, @metricsToShow)
              elsif calc == 'time'
                MetricGrade.calcStandard(metric.metric_config_id, mid, gcid, @metricsToShow)
              end
            end
          end 
        end
        DailyGrade.calculate(@dateToShow, @metricsToShow)
        @grade = DailyGrade.getGrade(@dateToShow)
      end

end
