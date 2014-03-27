class FeedbackItem < ActiveRecord::Base
	belongs_to :item
	belogns_to :user

	validates :grade,
				numericality: { only_integer: true,  greather_than_or_equal_to: 0, less_than_or_equal_to: 10 }
	validates :description,
				presence: false
	
end
