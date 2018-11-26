class Player < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :power, :inclusion => {:in => 1..99, :message => "Power should be between 1 and 99"}
end
