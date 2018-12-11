class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :title
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
