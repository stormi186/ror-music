class TrackPlaylistsController < ApplicationController
	before_action :logged_in_user
	before_action :authorize_for_users

  def create
  	@track = Track.find(params[:trackId])
    @playlist = Playlist.find(params[:playlist_track][:playlist_id] || params[:id])
    if PlaylistTrack.create(track: @track, playlist: @playlist)
      redirect_to tracks_path, notice: 'Track has been added'
    else
      redirect_to tracks_path, alert: 'Something went wrong...*sad panda*'
    end
  end
  
  def destroy
  	@track = Track.find(params[:track_id])
  	@playlist = Playlist.find(params[:playlist_id])
    PlaylistTrack.where(track_id: @track.id, playlist_id: @playlist.id).first.destroy
    redirect_to playlist_path(@playlist), notice: 'Track is no longer in playlist'
  end
  
end