class Category < ApplicationRecord
    has_many :category_products
    has_many :product, through: :categoty_products 
    validates :name, presence: true
end
