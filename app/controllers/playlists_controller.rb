class PlaylistsController < ApplicationController
	before_action :find_playlist, { only: [:edit, :update, :show, :destroy] }
	before_action :logged_in_user
	before_action :authorize_for_users
	
	def index
    @playlists = Playlist.where(user_id: current_user.id)
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user_id = current_user.id

    if @playlist.save
      flash[:notice] = 'Playlist created successfully.'
      redirect_to playlists_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @playlist.update(playlist_params)
      redirect_to playlist_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @playlist.destroy
    flash[:notice] = 'Playlist deleted successfully!'
    redirect_to playlists_path
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, :user_id);
  end

  def find_playlist
    @playlist = Playlist.find(params[:id])
  end
end

