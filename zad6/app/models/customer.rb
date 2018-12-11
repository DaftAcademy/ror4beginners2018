class Customer < ApplicationRecord
  has_many :products

  validates :name, presence: true,
                   uniqueness: true,
                   length: { in: 2..30 }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 255 },
                    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
end 
