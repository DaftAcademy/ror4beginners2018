class Product < ApplicationRecord
  belongs_to :customer
  has_many :category_products
  has_many :categories, through: :category_products

  validates :price, numericality: { greater_than: 0 }
end
