class Player < ApplicationRecord
	validates :first_name, :last_name, presence: true
	validates :power, presence: true, numericality: {greater_than: 0, less_than: 100}
end
