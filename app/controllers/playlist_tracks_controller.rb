class PlaylistTracksController < ApplicationController
	before_action :set_track

  def create
    if Playlist_Track.create(track: @track, playlist: @playlist)
      redirect_to tracks_path, notice: 'Track has been added'
    else
      redirect_to tracks_path, alert: 'Something went wrong...*sad panda*'
    end
  end
  
  def destroy
    Favorite.where(track_id: @track.id, playlist_id: @playlist_id).first.destroy
    redirect_to tracks_path, notice: 'Track is no longer in playlist'
  end
  
  private
  
  def set_track
    @track = Track.find(params[:track_id] || params[:id])
  end
end