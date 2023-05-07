class SubCategory < ApplicationRecord
  belongs_to :main_category
  has_many :products
  validates :name, presence: true, uniqueness: true
end
