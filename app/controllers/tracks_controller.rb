class TracksController < ApplicationController
	before_action :find_track, { only: [:edit, :update, :show, :destroy] }

	def index
  	@tracks = Track.search(params[:term])
	end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)

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

  def favorite
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @track
      redirect_to :back, notice: 'You favorited #{@track.name}'

    elsif type == "unfavorite"
      current_user.favorites.delete(@track)
      redirect_to :back, notice: 'Unfavorited #{@track.name}'

    else
      redirect_to :back, notice: 'Nothing happened.'
    end
  end
end

