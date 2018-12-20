class Category < ApplicationRecord
  has_many :category_products
  has_many :products, through: :category_products
end
