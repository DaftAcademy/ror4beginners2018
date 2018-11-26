class Player < ApplicationRecord
	validates :first_name, :last_name, presence: true
	validates :power, numericality: {greater_than: 0, less_than_or_equal: 99}
end
