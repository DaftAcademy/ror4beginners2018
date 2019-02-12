class Product < ApplicationRecord
    belongs_to :customer
    has_many :categories, through: :category_product
    
    scope :sorted, -> { order(price: :desc) }
    scope :cheaper_than, -> p { where('price < ?', p) }

end
