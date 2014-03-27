class Category < ActiveRecord::Base
	has_many :items

#TODO: REGEX for name
	validates :name,
				presence: true,
				length: { maximum: 100, too_long: 'Maximum is %{count} characters '}
end
