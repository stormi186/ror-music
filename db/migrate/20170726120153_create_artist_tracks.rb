class ArtistTracks < ActiveRecord::Migration[5.1]
  def change
  	create_table :artist_tracks do |t|
  	  t.references :artist, index: true, foreign_key: true
      t.references :track, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
