class Product < ApplicationRecord
  belongs_to :customer 
  has_many :products_category 
  has_many :categories, through: :products_category 
end
