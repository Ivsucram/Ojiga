class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :item

	validates :description,
				presence: true
end
