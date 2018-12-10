class Category < ApplicationRecord
    has_many :products, through: :category_products

    validates :name, presence: true
end
