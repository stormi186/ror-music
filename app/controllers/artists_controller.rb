class ArtistsController < ApplicationController
	before_action :find_artist, { only: [:edit, :update, :show, :destroy] }
	before_action :logged_in_user
	
	def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.user_id = current_user.id

    if @artist.save
      flash[:notice] = 'Artist created successfully.'
      redirect_to artists_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @artist.update(artist_params)
      redirect_to artist_path
    else
      render :edit
    end
  end

  def show
  	@top_tracks = Favorite.joins("LEFT OUTER JOIN tracks ON favorites.track_id = tracks.id").select("favorites.*,tracks.name as name,tracks.artist_id as artist_id").where("tracks.artist_id = #{@artist.id}").group(:track_id).order('COUNT(tracks.id) DESC')
  .limit(10)
  	if @top_tracks.nil?
  		@top_tracks = Track.where(artist_id: @artist.id)
  	end
  end

  def destroy
  	if @artist.user_id = current_user.id
    	@artist.destroy
   	 flash[:notice] = 'Artist deleted successfully!'
    	redirect_to artists_path
  	else
  	flash[:notice] = 'Not authorized'
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

