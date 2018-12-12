class Product < ApplicationRecord
	#has_and_belongs_to_many :categories # lepiej 1-*|*-1
	has_many :categories, through: :category_product 
	belongs_to :customer, optional: true
	validates :name, presence: true, uniqueness: true
	validates :price, presence: true, numericality: true
	scope :sorted, -> { order(price: :desc) }
	scope :cheap, -> (value) { where('price <= ?', value) }
end
