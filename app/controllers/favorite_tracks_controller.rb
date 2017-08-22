class FavoriteTracksController < ApplicationController
	before_action :set_track
	before_action :logged_in_user
	before_action :authorize_for_users

  def create
    if Favorite.create(track: @track, user: current_user)
      redirect_to tracks_path, notice: 'Track has been favorited'
    else
      redirect_to tracks_path, alert: 'Something went wrong...*sad panda*'
    end
  end
  
  def destroy
    Favorite.where(track_id: @track.id, user_id: current_user.id).first.destroy
    redirect_to tracks_path, notice: 'Track is no longer in favorites'
  end
  
  private
  
  def set_track
    @track = Track.find(params[:track_id] || params[:id])
  end
end