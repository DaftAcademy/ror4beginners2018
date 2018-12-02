class Track < ApplicationRecord
  validates :title, presence: :true
  belongs_to :artist
  has_many :playlist_tracks, dependent: :destroy
  has_many :playlists, through: :playlist_track
end
