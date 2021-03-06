class Admin::ArtistsController < Admin::BaseController
	before_action :find_artist, { only: [:edit, :update, :show, :destroy] }

	def index
    @artists = @albums = Artist.paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.user_id = current_user.id

    if @artist.save
      flash[:notice] = 'Artist created successfully.'
      redirect_to admin_artists_path
    else
      render :new
    end
  end

  def edit
  	if @artist.user_id == current_user.id
  		render 'edit'
  	else
  		flash[:notice] = 'Unauthorized access'
  		redirect_to admin_artists_path
  	end
  end

  def update
    if @artist.update(artist_params)
      redirect_to [:admin, @artist]
    else
      render :edit
    end
  end

  def show
  end

  def destroy
  	if @artist.user_id = current_user.id
    	@artist.destroy
   	 flash[:notice] = 'Artist deleted successfully!'
    	redirect_to admin_artists_path
  	else
  	flash[:notice] = 'Not authorized'
  	end
  end

  private

  def artist_params
    params.require(:artist).permit(:name);
  end

  def find_artist
    @artist = Artist.find(params[:id])
  end
end

