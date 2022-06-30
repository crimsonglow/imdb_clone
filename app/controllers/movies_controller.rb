class MoviesController < ApplicationController
  before_action :current_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :actions_admin, only: [:new, :edit, :destroy, :create]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
    render :new
  end

  def edit
    render :edit
  end

  def create
    @movie = current_user.movies.create(movie_params)

    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def update
     if @movie.update(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  def show

  end

private

  def current_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    (params.require(:movie).permit(:title, :category, :description))
  end

end
