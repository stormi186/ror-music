class PlaylistTracksController < ApplicationController
	before_action :logged_in_user
	before_action :authorize_for_users
  
  def destroy
  	@track = Track.find(params[:track_id])
  	@playlist = Playlist.find(params[:playlist_id])
    PlaylistTrack.where(track_id: @track.id, playlist_id: @playlist.id).first.destroy
    redirect_to playlist_path(@playlist), notice: 'Track is no longer in playlist'
  end
  
end