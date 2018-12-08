class Artist < ApplicationRecord
  has_many :tracks, dependent: :destroy
end
