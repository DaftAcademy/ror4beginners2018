class Category < ApplicationRecord
  has_many :products_category 
  has_many :products, through: :products_category 
end
