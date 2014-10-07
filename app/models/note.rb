class Note < ActiveRecord::Base
	belongs_to :users

	validates :notedate, presence: true
  	validates :user_id, presence: true
end
