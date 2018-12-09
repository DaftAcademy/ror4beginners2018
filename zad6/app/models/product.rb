class Product < ApplicationRecord
    belongs_to  :customer, optional: true
    has_many    :category_products
    has_many    :categories, through: :category_products
    
    validates   :name,  presence: true
    validates   :price, presence: true, numericality: {greater_than: 0} #format: { with: /^\d+??(?:\.\d{0,2})?$/ }
    
    scope       :sorted, -> { order(price: :desc) }
    scope       :cheaper_than, -> p { where('price < ?', p) }
end

