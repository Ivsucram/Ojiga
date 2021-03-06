class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.integer :category_id

      t.string :name
      t.string :picture
      t.text :description
      t.decimal :rentUnitPrice
      t.time :unitTime
      t.time :minimumRentingTime
      t.time :maximumRentingTime
      t.decimal :totalValue
      t.boolean :isAvailable

      t.timestamps
    end
  end
end
