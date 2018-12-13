class Category < ApplicationRecord
    #has_and_belongs_to_many :products # lepiej 1-*|*-1
	has_many :products, through: :category_product
	validates :name, presence: true, uniqueness: true
end
