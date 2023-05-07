class MainCategory < ApplicationRecord
  has_many :sub_categories, inverse_of: :main_category
  validates :name, presence: true, uniqueness: true
end
