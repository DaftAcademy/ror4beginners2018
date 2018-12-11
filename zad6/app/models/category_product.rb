class CategoryProduct < ApplicationRecord

  belongs_to :products
  belongs_to :category

end
