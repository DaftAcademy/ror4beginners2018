class Player < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :power, inclusion: 1...100
  attribute :captain, default: false
end
