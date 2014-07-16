class Item < ActiveRecord::Base
	has_many :posts
	has_many :items
	has_many :feedback_items

	belongs_to :user
	belongs_to :category

	validates :user,
				presence: true
	validates :category,
				presence: true
#TODO: REGEX for name
	validates :name,
				presence: true,
				length: { maximum: 100, too_long: 'Maximum is %{count} characters '}
	validates :picture,
				presence: true
	validates :description,
				presence: true
	validates :rentUnitPrice,
				presence: true,
				numericality: { greather_than: 0 }
#Insertion must be made using Time.at(xxx) where xxx is the amount of time in seconds. So xxx = 60*60*24 is one day
	validates :unitTime,
				presence: true
#Insertion must be made using Time.at(xxx) where xxx is the amount of time in seconds. So xxx = 60*60*24 is one day
	validates :minimumRentingTime,
				presence: false
#Insertion must be made using Time.at(xxx) where xxx is the amount of time in seconds. So xxx = 60*60*24 is one day
	validates :maximumRentingTime,
				presence: false
	validates :totalValue,
				numericality: { greather_than: 0 }
	validates :isAvailable,
				inclusion: { in: [true, false] }

#TODO Validation for unitTime between minimumRentingTime and maximumRentingTime
#TODO Validation for minimumRentingTime less or equal maximumRentingTime

end
