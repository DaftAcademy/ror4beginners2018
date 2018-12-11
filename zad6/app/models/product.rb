class Product < ApplicationRecord
  default_scope { order('price desc') }

  belongs_to :customer, optional: true
  has_many :product_categories
  has_many :categories, through: :product_categories

  validates :name, presence: true
  validates :name, length: { in: 3..50 }
  validates :price, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
