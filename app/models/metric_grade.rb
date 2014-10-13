class MetricGrade < ActiveRecord::Base
	has_many :grades
	has_many :metrics
end
