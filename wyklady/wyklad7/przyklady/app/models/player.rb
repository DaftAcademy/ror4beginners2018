class Player < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :power, presence: true, numericality: { greater_than: 0, less_than: 100 }
  scope :stronger_than, ->(power) { where('power > ?', power) }

  def powerful_captain?
    power > 90 && captain?
  end
end
