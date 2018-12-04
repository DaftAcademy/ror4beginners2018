class Track < ApplicationRecord
  belongs_to :artist
  validates :title, presence: true
  has_many :playlist_tracks, dependent: :destroy
  has_many :playlists, through: :playlist_tracks
end
