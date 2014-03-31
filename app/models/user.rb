class User < ActiveRecord::Base
	has_many :items
	has_many :posts
	has_many :feedback_items
	has_many :logs
	has_many :achievements

	has_and_belongs_to_many :feedbacks_received, class_name: 'FeedbackUser', :join_table => 'feedbacks_received', :foreign_key => 'user_received_id', :association_foreign_key => 'feedback_user_id'
	has_and_belongs_to_many :feedbacks_sent, class_name: 'FeedbackUser', :join_table => 'feedbacks_sent', :foreign_key => 'user_sent_id', :association_foreign_key => 'feedback_user_id'

#TODO: Regex for name, nick, e-mail, e-mail_confirmation, password, password_confirmation

	validates :name,
				presence: true,
				length: { maximum: 100, too_long: 'Maximum is %{count} characters' }
	validates :nick,
				allow_nil: true,
				uniqueness: true,
				length: { maximum: 30, too_long: 'Maximum is %{count} characters' }
	validates :email,
				presence: true,
				uniqueness: true,
				confirmation: true,
				length: { maximum: 100, too_long: 'Maximum is %{count} characters' }
	validates :password,
				presence: true,
				confirmation: true,
				length: { maximum: 50, too_long: 'Maximum is %{count} characters '}
	validates :picture,
				presence: false
	validates :birthday,
				presence: true
	validates :isTermConditionsChecked,
                inclusion: { in: [true, false] }

	validate :cannot_be_future_date

	after_validation :downcase_email

	private

	def feedbacks_received=(array)
		array.each do |fb|
			if !fb.is_a? FeedbackUser then return nil end
		end
		array.aech do |fb|
			fb.target << self
		end
	end

	def feedbacks_sent=(array)
		array.each do |fb|
			if !fb.is_a? FeedbackUser then return nil end
		end
		array.aech do |fb|
			fb.owner << self
		end
	end

	def cannot_be_future_date
		if !birthday.nil? and birthday.is_a? Date then
			errors.add(:birthday, 'can not be future date') if birthday > Date.today
		end
	end

	def downcase_email
		if !email.nil? and email.is_a? String then
			email.downcase!
		end
		if !email_confirmation.nil? and email_confirmation.is_a? String then
			email_confirmation.downcase!
		end
	end

end
