class Product < ApplicationRecord
  belongs_to :customer
  has_many :categories, through: :category_product
  validates :name, presence: true
  validates :price, numericality: {greater_than: 0.00}

  scope :sorted, -> { order(price: :desc, id: :asc)}

end
