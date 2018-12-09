class Category < ApplicationRecord
    has_many :products, through: :category_product
    validates :name, presence: true
end
