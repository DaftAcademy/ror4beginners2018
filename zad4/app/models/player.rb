class Player < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :power, numericality: {greater_than: 0, less_than: 100} #format: {with: /\A(^[1-9][0-9]?$)\z/ }
end
