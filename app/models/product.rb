class Product < ApplicationRecord
  belongs_to :product_type
  has_many :purchases
end
