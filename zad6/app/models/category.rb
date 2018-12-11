class Category < ApplicationRecord
  has_many :products
  has_many :product_categories 

  validates :name, presence: true,
                   length: { in: 2..30 }
end 
