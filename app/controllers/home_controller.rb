class HomeController < ApplicationController
layout 'home'

  def index
  	if current_user.nil?
  		render "index"  
    elsif current_user.admin?
    	redirect_to admin_dashboard_path
    elsif current_user.superadmin?
    	redirect_to superadmin_dashboard_path
  	else
  		@top_tracks = Favorite.joins("LEFT OUTER JOIN tracks ON favorites.track_id = tracks.id").select("favorites.*,tracks.name as name, tracks.artist_id as artist_id").group(:track_id).order('COUNT(tracks.id) DESC')
  .limit(10)
  		@latest_albums = Album.last(5)
  		@tracks = Track.paginate(:page => params[:page], :per_page => 5).order(created_at: :desc)
      render "tracks/index"
    end
  end
end
