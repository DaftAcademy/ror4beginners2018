class Player < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :power, presence: true, :inclusion => 0..100
end
