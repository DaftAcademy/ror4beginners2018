class CreatePlaylistTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :playlist_tracks do |t|
      t.references :playlist, foreign_key: true
      t.references :track, foreign_key: true

      t.timestamps
    end
  end
end
