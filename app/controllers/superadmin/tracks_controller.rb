class Superadmin::TracksController < Superadmin::BaseController
	before_action :find_track, { only: [:edit, :update, :show, :destroy] }

	def index
  	@tracks = Track.search(params[:term]).paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
	end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)
    @track.user_id = current_user.id
    unless @track.album.nil? 
    	@track.genre_id = @track.album.genre_id
    	@track.artist_id = @track.album.artist_id
  	end
  	
    if @track.save
      flash[:notice] = 'Track created successfully.'
      redirect_to superadmin_tracks_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @track.update(track_params)
      redirect_to [:superadmin, @track]
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @track.destroy
    flash[:notice] = 'Track deleted successfully!'
    redirect_to superadmin_tracks_path
  end

  private

  def track_params
    params.require(:track).permit(:name, :duration, :genre_id, :artist_id, :album_id);
  end

  def find_track
    @track = Track.find(params[:id])
  end
end

