class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites
  end

  def create
    @favorite = current_user.favorites.build
    @favorite.track_id = params[:track_id]
    @favorite.save
  end
end
