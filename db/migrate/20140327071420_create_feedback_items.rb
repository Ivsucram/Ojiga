class CreateFeedbackItems < ActiveRecord::Migration
  def change
    create_table :feedback_items do |t|
      t.integer :grade
      t.test :description

      t.timestamps
    end
  end
end
