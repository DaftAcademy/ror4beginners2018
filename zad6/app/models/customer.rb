class Customer < ApplicationRecord
  has_many :products, through: category_product
end