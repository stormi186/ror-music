class HomeController < ApplicationController

  def index
  	@top_tracks = Favorite.joins("LEFT OUTER JOIN tracks ON favorites.track_id = tracks.id").select("favorites.*,tracks.name as name, tracks.artist_id as artist_id").group(:track_id).order('COUNT(tracks.id) DESC')
  .limit(10)
  	@latest_albums = Album.last(5)
  end
end
