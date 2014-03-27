class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :item
end
