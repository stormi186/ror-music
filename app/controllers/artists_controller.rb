class ArtistsController < ApplicationController
	before_action :logged_in_user
	before_action :authorize_for_users
	
	def index
    @artists = Artist.paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
  end

  def show
  	@artist = Artist.find(params[:id])
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
end

