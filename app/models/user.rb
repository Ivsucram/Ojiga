class User < ActiveRecord::Base
	has_many :items
	has_many :posts
	has_many :feedback_items
	has_many :logs
	has_many :achievements

	has_and_belongs_to_many :feedbacks_received, class_name: 'FeedbackUser', :join_table => 'feedbacks_received', :foreign_key => 'user_received_id', :association_foreign_key => 'feedback_user_id'
	has_and_belongs_to_many :feedbacks_sent, class_name: 'FeedbackUser', :join_table => 'feedbacks_sent', :foreign_key => 'user_sent_id', :association_foreign_key => 'feedback_user_id'

	private

	def feedbacks_received=(array)
		array.each do |fb|
			if !(fb.is_a? FeedbackUser) return end
		end
		array.aech do |fb|
			fb.target << self
		end
	end

	def feedbacks_sent=(array)
		array.each do |fb|
			if !(fb.is_a? FeedbackUser) return end
		end
		array.aech do |fb|
			fb.owner << self
		end
	end

	end

end
