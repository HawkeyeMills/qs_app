class GradeConfig < ActiveRecord::Base
  has_many :metric_configs, dependent: :destroy
  #default_scope -> { order('date DESC') }
  validates :weight, presence: true, length: { maximum: 25 }
  validates :metricconfig_id, presence: true
end
