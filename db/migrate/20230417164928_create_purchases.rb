class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.integer :quantity, null: false
      t.decimal :price, null: false, precision: 10, scale: 2
      t.date :date_purchased, null: false
      
      t.timestamps
    end
  end
end
