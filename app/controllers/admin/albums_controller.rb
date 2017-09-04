class Admin::AlbumsController < Admin::BaseController
	before_action :find_album, { only: [:edit, :update, :show, :destroy] }

	def index
    @albums = @albums = Album.paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @album.user_id = current_user.id

    if @album.save
      flash[:notice] = 'Album created successfully.'
      redirect_to admin_albums_path
    else
      render :new
    end
  end

  def edit
  	if @album.user_id == current_user.id
  		render 'edit'
  	else
  		flash[:notice] = 'Unauthorized access'
  		redirect_to admin_albums_path
  	end
  end

  def update
    if @album.update(album_params)
      redirect_to [:admin, @album]
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @album.destroy
    flash[:notice] = 'Album deleted successfully!'
    redirect_to admin_albums_path
  end

  private

  def album_params
    params.require(:album).permit(:name, :year, :artist_id, :genre_id);
  end

  def find_album
    @album = Album.find(params[:id])
  end
end

