class AlbumsController < ApplicationController
	before_action :logged_in_user
	before_action :authorize_for_users
	
	def index
    @albums = Album.paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
  end

  def show
  	@album = Album.find(params[:id])
  end

  private

  def album_params
    params.require(:album).permit(:name, :year, :artist_id, :genre_id)
  end
end

