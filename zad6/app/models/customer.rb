class Customer < ApplicationRecord
  has_many :products
  validates :email, presence: true
end
