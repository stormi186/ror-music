class GenresController < ApplicationController
	before_action :find_genre, { only: [:edit, :update, :show, :destroy] }
	before_action :logged_in_user
	before_action :authorize_for_users
	
	def index
    @genres = Genre.all
  end

  def show
  	@tracks = Track.where(genre_id: params[:id])
  end

  private

  def genre_params
    params.require(:genre).permit(:name);
  end

  def find_genre
    @genre = Genre.find(params[:id])
  end
end

