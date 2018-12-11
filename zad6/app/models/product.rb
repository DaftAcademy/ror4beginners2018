class Product < ApplicationRecord
    has_many :category_products
    has_many :categories, through: :category_products
    validates :name, presence: true
    validates :price, numericality: {greater_than: 0}, presence: true

    scope :higher_than, -> (w) {where('price > ?', w)}
end
