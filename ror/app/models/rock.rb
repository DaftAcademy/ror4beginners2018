class Rock < ApplicationRecord
  validates :weight, presence: true, numericality: {greater_than: 0}
end
