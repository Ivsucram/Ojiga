class Achievement < ActiveRecord::Base
	belongs_to :user

#TODO: REGEX for name
	validates :user,
				presence: true
	validates :name,
				presence: true,
				length: { maximum: 100, too_long: 'Maximum is %{count} characters '}

end
