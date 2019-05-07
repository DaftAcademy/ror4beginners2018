class Category < ApplicationRecord
	has_many :category_products
	has_many :products, through: :category_products
	validates :name, presence: true, format: /\w{2,}/
end
