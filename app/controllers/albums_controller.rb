class AlbumsController < ApplicationController
	before_action :find_album, { only: [:edit, :update, :show, :destroy] }
	before_action :logged_in_user
	before_action :authorize_for_users
	
	def index
    @albums = Album.all
  end

  def show
  end

  private

  def album_params
    params.require(:album).permit(:name, :year, :artist_id, :genre_id);
  end

  def find_album
    @album = Album.find(params[:id])
  end
end

