class TracksController < ApplicationController
	before_action :logged_in_user
	before_action :authorize_for_users
	
	def index
  	@tracks = Track.search(params[:term]).paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
  	#lokalno radi
  	@top_tracks = Favorite.joins("LEFT OUTER JOIN tracks ON favorites.track_id = tracks.id").select("favorites.*,tracks.name as name, tracks.artist_id as artist_id").group(:track_id).order('COUNT(tracks.id) DESC').limit(10)
    #ne radi sa pg
    #@top_tracks = Favorite.joins('join tracks on favorites.track_id = tracks.id').select('favorites.id, favorites.user_id, favorites.track_id, favorites.created_at, favorites.updated_at, tracks.name, tracks.artist_id').group('track_id').order('COUNT(tracks.id) DESC').limit(10)
  	@latest_albums = Album.order('created_at DESC').last(5)
	end

  def show
  	@track = Track.find(params[:id])
  end

  private

  def track_params
    params.require(:track).permit(:name, :duration, :genre_id, :artist_id, :album_id);
  end
end

