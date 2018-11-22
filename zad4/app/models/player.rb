class Player < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :power, inclusion: 1..99

  def name
    "#{self.first_name} #{self.last_name} #{'(C)' if self.captain}"
  end
end
