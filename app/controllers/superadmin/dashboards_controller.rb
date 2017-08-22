class Superadmin::DashboardsController < Superadmin::BaseController
  def show
  	@users = User.all
		@tracks = Track.all
		@artists = Artist.all
		@genres = Genre.all
		@albums = Album.all
  end
end
