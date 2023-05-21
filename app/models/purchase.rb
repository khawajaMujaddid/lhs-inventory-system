class Purchase < ApplicationRecord
  belongs_to :product
  validates_presence_of :price, :quantity, :date_purchased

  def update_product_quantity
    product.quantity += quantity
    product.save
  end
end
