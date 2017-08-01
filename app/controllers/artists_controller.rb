class ArtistsController < ApplicationController
	before_action :find_artist, { only: [:edit, :update, :show, :destroy] }

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

