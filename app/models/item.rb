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
				numericality: { greather_than: 0 }
#TODO: Research how to insert periods of time, not the time ( hour ) itself
	validates :unitTime,
				presence: true
	validates :minimumRentingTime,
				presence: false
	validates :maximumRentingTime,
				presence: false
	validates :totalValue,
				numericality: { greather_than: 0 }
	validates :isAvailable,
				inclusion: { in: [true, false] }

end
