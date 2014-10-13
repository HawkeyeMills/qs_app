class MetricConfig < ActiveRecord::Base
  belongs_to :user
  has_many :metrics
  has_many :grade_configs
  
  default_scope -> { order('orderby ASC') }
  #default_scope where(profiledisplay: true).order("orderby ASC")
  
  validates :metricname, presence: true, length: { maximum: 35}
  validates :user_id, presence: true
  #validates :metricdate, presence: true
end