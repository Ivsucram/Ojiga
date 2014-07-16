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
				numericality: { greather_than_or_equal_to: 0.01 }
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
				presence: true,
				numericality: { greather_than_or_equal_to: 0.01 }
	validates :isAvailable,
				inclusion: { in: [true, false] }

	validate :custom_validate_numericality
	validate :rentUnit_between_minimumRentingTime_and_maximumRentingTime

#TODO Validation for minimumRentingTime less or equal maximumRentingTime
#TODO Validation for totalValue is bigger or equal rentUnitPrice

	private

#TODO In the future take out this custom valdiation and make the numericality standard validation work
	def custom_validate_numericality
		minimum = BigDecimal.new('0.01')

		if (!rentUnitPrice.nil? and minimum >= rentUnitPrice) then
			errors.add(:rentUnitPrice, 'custom_validate_numericality')
		end
		if (!totalValue.nil? and minimum >= totalValue) then
			errors.add(:totalValue, 'custom_validate_numericality')
		end
	end

	def rentUnit_between_minimumRentingTime_and_maximumRentingTime
		if (!unitTime.nil? and !minimumRentingTime.nil? and !maximumRentingTime.nil?) then
			if (unitTime < minimumRentingTime) then
				errors.add(:unitTime, 'less than minimum renting price')
			end
			if (unitTime > maximumRentingTime) then
				errors.add(:unitTime, 'greather than maximum renting price')
			end
		end
	end

	def minimumRentingTime_LessOrEqual_maximumRentingTime
		if (!minimumRentingTime.nil? and !maximumRentingTime.nil?) then
			if (minimumRentingTime > maximumRentingTime)
				errors.add(:minimumRentingTime, 'greater than maximum renting price')
			end
		end
	end

end
