class Category < ApplicationRecord
    has_many :product_categoryies
    has_many :products, through: product_categoryies
end
