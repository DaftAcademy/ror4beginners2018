class Player < ApplicationRecord
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :power, presence: true, numericality: {greather_than: 0, less_than: 100}
end
