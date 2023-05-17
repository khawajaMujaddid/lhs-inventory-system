class MainCategory < ApplicationRecord
  has_many :sub_categories, inverse_of: :main_category
  validates :name, presence: true, uniqueness: true
  accepts_nested_attributes_for :sub_categories, allow_destroy: true, reject_if: :all_blank
end
