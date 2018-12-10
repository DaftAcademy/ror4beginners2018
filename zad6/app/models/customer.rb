class Customer < ApplicationRecord
	has_many :products, dependant: :destroy
	validates :name, presence: true, uniqueness: true, format: /\w{2,}/
end
