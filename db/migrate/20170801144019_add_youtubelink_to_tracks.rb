class AddYoutubelinkToTracks < ActiveRecord::Migration[5.1]
  def change
  	add_column :tracks, :youtubelink, :string, default: 'https://www.youtube.com'
  end
end
