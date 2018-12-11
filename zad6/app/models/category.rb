class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories

  validates :name, presence: true
  validates :name, length: { in: 3..50 }
end
