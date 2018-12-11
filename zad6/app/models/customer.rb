class Customer < ApplicationRecord
  has_many :products

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { in: 3..50 }
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, length: { maximum: 255 }
  validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }

end
