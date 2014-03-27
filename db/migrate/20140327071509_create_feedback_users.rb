class CreateFeedbackUsers < ActiveRecord::Migration
  def change
    create_table :feedback_users do |t|
      t.integer :grade
      t.text :description

      t.timestamps
    end
  end
end
