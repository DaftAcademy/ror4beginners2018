class Customer < ApplicationRecord
	has_many :product
	validates :name, presence: true, uniqueness: true
end
