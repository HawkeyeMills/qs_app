class MetricConfig < ActiveRecord::Base
  belongs_to :user
  belongs_to :metric
  default_scope -> { order('orderby DESC') }
  validates :value, presence: true, length: { maximum: 25 }
  validates :user_id, presence: true
end