class Product < ApplicationRecord
  has_many :category_products
  has_many :categories, through: :category_products
  belongs_to :customer
  validates :name, presence: true
  validates :price, presence: true
end
