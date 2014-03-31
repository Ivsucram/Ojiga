class FeedbackItem < ActiveRecord::Base
	belongs_to :item
	belongs_to :user

	validates :item,
				presence: true
	validates :user,
				presence: true
	validates :grade,
				numericality: { only_integer: true,  greather_than_or_equal_to: 0, less_than_or_equal_to: 10 }
	validates :description,
				presence: false
	
end
