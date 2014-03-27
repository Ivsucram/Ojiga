class Item < ActiveRecord::Base
	has_many :posts
	has_many :items
	has_many :feedback_items

	belongs_to :user
	belongs_to :category
end
