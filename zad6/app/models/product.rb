class Product < ApplicationRecord
  has_many :category, through: category_product
  belongs_to :customer
end
