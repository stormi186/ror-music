class TracksController < ApplicationController
	before_action :find_track, { only: [:edit, :update, :show, :destroy] }
	before_action :logged_in_user
	before_action :authorize_for_users
	
	def index
  		@tracks = Track.paginate(:page => params[:page], :per_page => 5).order(created_at: :desc)
			#@tracks = Track.order(created_at: :desc)
  	  	@top_tracks = Favorite.joins("LEFT OUTER JOIN tracks ON favorites.track_id = tracks.id").select("favorites.*,tracks.name as name, tracks.artist_id as artist_id").group(:track_id).order('COUNT(tracks.id) DESC')
  .limit(10)
  	@latest_albums = Album.last(5)
	end

  def show
  end

  private

  def track_params
    params.require(:track).permit(:name, :duration, :genre_id, :artist_id, :album_id);
  end

  def find_track
    @track = Track.find(params[:id])
  end
  
end

