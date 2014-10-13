class GradeConfig < ActiveRecord::Base
  belongs_to :metric_configs
  has_many :grade_calcs
  validates :weight, presence: true, length: { maximum: 25 }
  validates :metric_config_id, presence: true
  validates :grade_calc_id, presence: true
end