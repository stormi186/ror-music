class FavoritesController < ApplicationController
	before_action :logged_in_user

  def index
    @favorites = Favorite.where(user_id: current_user.id).paginate(:page => params[:page], :per_page => 5).order(created_at: :desc)
  end
  
  def destroy
  	@track = Track.find(params[:track_id] || params[:id])
    Favorite.where(track_id: @track.id, user_id: current_user.id).first.destroy
    redirect_to tracks_path, notice: 'Track is no longer in favorites'
  end
 
end