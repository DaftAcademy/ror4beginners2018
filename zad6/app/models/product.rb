class Product < ApplicationRecord
	belongs_to :customer, optional: true
	has_many :category_products
	has_many :categories, through: :category_products
	validates :name, presence: true, format: /\w{2,}/
	validates :price, presence: true, numericality: { greather_than: 0}
end
