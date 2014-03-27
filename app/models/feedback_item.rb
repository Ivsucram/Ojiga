class FeedbackItem < ActiveRecord::Base
	belongs_to :item
	belogns_to :user
end
