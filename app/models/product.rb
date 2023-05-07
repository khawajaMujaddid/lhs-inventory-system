class Product < ApplicationRecord
  belongs_to :main_category
  belongs_to :sub_category
  has_many :purchases
end
