class Product < ApplicationRecord
  has_many :category
  has_one :customer
end
