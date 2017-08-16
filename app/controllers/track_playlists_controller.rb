class TrackPlaylistsController < ApplicationController
	before_action :set_track_and_playlist

  def create
    if PlaylistTrack.create(track: @track, playlist: @playlist)
      redirect_to tracks_path, notice: 'Track has been added'
    else
      redirect_to tracks_path, alert: 'Something went wrong...*sad panda*'
    end
  end
  
  def destroy
    PlaylistTrack.where(track_id: @track.id, playlist_id: @playlist.id).first.destroy
    redirect_to tracks_path, notice: 'Track is no longer in playlist'
  end
  
  private
  
  def set_track_and_playlist
    @track = Track.find(params[:trackId])
    @playlist = Playlist.find(params[:playlist_track][:playlist_id] || params[:id])
  end
end