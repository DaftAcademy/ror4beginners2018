class Player < ApplicationRecord
<<<<<<< HEAD
   validates :first_name, :last_name, presence: true
   validates :power, inclusion: 1..99
=======
  validates :first_name, :last_name, presence: true
  validates :power, presence: true, numericality: { greater_than: 0, less_than: 100 }
>>>>>>> 5ce1fe2de31db652fbead0b82e9d9d1a04d1d8ca
end
