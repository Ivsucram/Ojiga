class CreateFeedbackUsers < ActiveRecord::Migration
  def change
    create_table :feedback_users do |t|
      t.integer :grade
      t.test :description

      t.timestamps
    end
  end
end
