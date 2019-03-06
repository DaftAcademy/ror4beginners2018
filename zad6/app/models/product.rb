class Product < ApplicationRecord
    belongs_to :customer
    has_many :category_products
    has_many :categorys, through: :categoty_products 
    validates :name, presence: true
    'validates :price, numericality: true, format: /(\.\d{0,2})/ ' 
    validate :priceformat


    def priceformat
        begin
            if (price*100).floor != price*100 
                errors.add(:price, 'wrong price format')
            end
        rescue => e
            errors.add(:price, e.message)
        end
    end


   

end
