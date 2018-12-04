class Rock < ApplicationRecord
  validates :weight, presence: true, numericality: {greater_than: 0}
  validate :luck

  def luck
    #errors.add(:pole, 'zwrot bledu'))
    errors.add(:base, 'bad luck') if (rand(2)).zero?
  end
end
