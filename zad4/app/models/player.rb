class Player < ApplicationRecord
  validates :first_name, :last_name
  validates :power, numericality: { greater_than: 0, lower_than: 100 }
end
