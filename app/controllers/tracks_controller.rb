class TracksController < ApplicationController
	before_action :find_track, { only: [:edit, :update, :show, :destroy] }
	before_action :logged_in_user
	
	def index
  	if (params[:term].nil?)
  		@tracks = Track.paginate(:page => params[:page], :per_page => 5).order(created_at: :desc)
			#@tracks = Track.order(created_at: :desc)
		else
  		@tracks = Track.search(params[:term])
  	end
  	  	@top_tracks = Favorite.joins("LEFT OUTER JOIN tracks ON favorites.track_id = tracks.id").select("favorites.*,tracks.name as name").group(:track_id).order('COUNT(tracks.id) DESC')
  .limit(10)
  	@latest_albums = Album.last(5)
	end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)
    @track.user_id = current_user.id
    @track.genre_id = @track.album.genre_id

    if @track.save
      flash[:notice] = 'Track created successfully.'
      redirect_to tracks_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @track.update(track_params)
      redirect_to track_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @track.destroy
    flash[:notice] = 'Track deleted successfully!'
    redirect_to tracks_path
  end

  private

  def track_params
    params.require(:track).permit(:name, :duration, :genre_id, :artist_id, :album_id);
  end

  def find_track
    @track = Track.find(params[:id])
  end

  def add_to_playlist
		respond_to do |format|
			format.html
			format.js
		end
	end
end

