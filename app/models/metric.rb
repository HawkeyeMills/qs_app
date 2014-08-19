class Metric < ActiveRecord::Base
  has_many :metricconfigs, dependent: :destroy
  default_scope -> { order('date DESC') }
  validates :value, presence: true, length: { maximum: 25 }
  validates :metricconfig_id, presence: true
end