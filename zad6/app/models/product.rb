class Product < ApplicationRecord
  scope :sorted, -> { order(price: des ) }

  has_one :customer
  has_many :products_categories
  belongs_to :customer
  
  validates :name, presence: true,
                   length: { in: 3..40 }
  validates :price, presence: true,
                    numericality: { greater_then_or_equal_to: 0 }
end 
