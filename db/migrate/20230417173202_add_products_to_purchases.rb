class AddProductsToPurchases < ActiveRecord::Migration[7.0]
  def change
    add_reference :purchases, :product, null: false, foreign_key: true
  end
end
