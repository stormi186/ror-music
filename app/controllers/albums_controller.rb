class AlbumsController < ApplicationController
	before_action :find_album, { only: [:edit, :update, :show, :destroy] }

	def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      flash[:notice] = 'Album created successfully.'
      redirect_to albums_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @album.update(album_params)
      redirect_to album_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @album.destroy
    flash[:notice] = 'Album deleted successfully!'
    redirect_to albums_path
  end

  private

  def album_params
    params.require(:album).permit(:name, :year, :artist_id, :genre_id);
  end

  def find_album
    @album = Album.find(params[:id])
  end
end

