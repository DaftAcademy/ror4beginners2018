class AddTracksToArtist < ActiveRecord::Migration[5.2]
  def change
    add_reference :artists, :track, foreign_key: true
  end
end
