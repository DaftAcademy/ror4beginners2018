class Product < ApplicationRecord

  belongs_to :customer, optional: true
  has_many :category_products
  has_many :categories, through: :category_products

  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }

  scope :sorted, -> { order(price: :desc, id: :asc) }

end
