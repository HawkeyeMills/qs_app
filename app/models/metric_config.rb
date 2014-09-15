class MetricConfig < ActiveRecord::Base
  belongs_to :user
  has_many :metrics
  
  default_scope -> { order('orderby DESC') }
  
  validates :metricname, presence: true, length: { maximum: 25 }
  validates :user_id, presence: true
  #validates :metricdate, presence: true
end