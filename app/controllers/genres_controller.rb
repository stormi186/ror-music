class GenresController < ApplicationController
	before_action :find_genre, { only: [:edit, :update, :show, :destroy] }
	before_action :logged_in_user
	
	def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.user_id = current_user.id

    if @genre.save
      flash[:notice] = 'Genre created successfully.'
      redirect_to genres_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @genre.update(genre_params)
      redirect_to genre_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @genre.destroy
    flash[:notice] = 'Genre deleted successfully!'
    redirect_to genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name);
  end

  def find_genre
    @genre = Genre.find(params[:id])
  end
end

