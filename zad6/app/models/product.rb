class Product < ApplicationRecord
  belongs_to :costumer
  has_many :product_categories
  has_many :categories, through: :product_categories

  validates :name, presence: true
  validates :price, presence: true

  scope :cheaper_than, ->(p) { where('price < ?', p) }
  scope :sorted, -> { order(price: :desc, name: :asc) }
end
