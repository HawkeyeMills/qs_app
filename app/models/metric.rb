class Metric < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('date DESC') }
  validates :value, presence: true, length: { maximum: 25 }
  validates :user_id, presence: true
end
