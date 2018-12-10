class CategoryProduct < ApplicationRecord
  belongs_to :category, :product
end
