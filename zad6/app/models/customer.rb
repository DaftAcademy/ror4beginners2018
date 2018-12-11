class Customer < ApplicationRecord
  has_many :products

  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\z/i }
end
