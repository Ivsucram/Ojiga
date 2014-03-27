class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :nick
      t.string :email
      t.stirng :password
      t.date :birthday
      t.string :picture
      t.boolean :isTermConditionsChecked

      t.timestamps
    end

    create_table :feedbacks_received, :id => false do |t|
      t.integer :user_received_id
      t.integer :feedback_user_id
    end

    create_table :feedbacks_sent, :id => false do |t|
      t.integer :user_sent_id
      t.integer :feedback_user_id
    end
  end
end
