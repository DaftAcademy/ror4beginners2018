class Player < ApplicationRecord
  validates :first_name, :last_name, presence: true 
  validates :power, inclusion: 1..99 
end
