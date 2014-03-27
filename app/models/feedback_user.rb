class FeedbackUser < ActiveRecord::Base
	has_and_belongs_to_many :user_gave_feedback, class_name: 'User', :join_table => 'feedbacks_sent', :foreign_key => 'feedback_user_id', :association_foreign_key => 'user_sent_id'
	has_and_belongs_to_many :user_received_feedback, class_name: 'User', :join_table => 'feedbacks_sent', :foreign_key => 'feedback_user_id', :association_foreign_key => 'user_received_id'

	validates :grade,
				numericality: { only_integer: true,  greather_than_or_equal_to: 0, less_than_or_equal_to: 10 }
	validates :description,
				presence: false
end
