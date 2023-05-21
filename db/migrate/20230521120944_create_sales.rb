class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.string :customer_name
      t.string :customer_email
      t.decimal :sale_price, null: false, precision: 10, scale: 2
      t.text :customer_address
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
