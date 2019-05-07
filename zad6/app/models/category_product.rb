class CategoryProduct < ApplicationRecord
	belongs_to :category
	belong_to :product
end
