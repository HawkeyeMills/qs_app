class GradeCalc < ActiveRecord::Base
	belongs_to :grade_configs

	def GradeCalc.calculate
		render :text => @dateToShow
	end
end
