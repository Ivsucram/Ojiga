class CreateFeedbackItems < ActiveRecord::Migration
  def change
    create_table :feedback_items do |t|
      t.integer :user_id
      t.integer :item_id

      t.integer :grade
      t.text :description

      t.timestamps
    end
  end
end
