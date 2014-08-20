class Metric < ActiveRecord::Base
  has_many :metric_configs, dependent: :destroy
  default_scope -> { order('metricdate DESC') }
  validates :value, presence: true, length: { maximum: 25 }
  validates :metricconfig_id, presence: true
end