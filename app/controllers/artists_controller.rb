class ArtistsController < ApplicationController
	before_action :find_artist, { only: [:edit, :update, :show, :destroy] }
	before_action :logged_in_user
	before_action :authorize_for_users
	
	def index
    @artists = Artist.all
  end

  def show
  	@top_tracks = Favorite.joins("LEFT OUTER JOIN tracks ON favorites.track_id = tracks.id").select("favorites.*,tracks.name as name,tracks.artist_id as artist_id").where("tracks.artist_id = #{@artist.id}").group(:track_id).order('COUNT(tracks.id) DESC')
  .limit(10)
  	if @top_tracks.nil?
  		@top_tracks = Track.where(artist_id: @artist.id)
  	end
  end

  private

  def artist_params
    params.require(:artist).permit(:name);
  end

  def find_artist
    @artist = Artist.find(params[:id])
  end
end

