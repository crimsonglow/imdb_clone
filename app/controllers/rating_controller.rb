class RatingController < ApplicationController
  before_action :authenticate_user!

  def create
    rating_for_movie = RatingForMovie.new
    rating_for_movie.user_id = current_user.id
    rating_for_movie.rating = rating
    rating_for_movie.movie_id = movie_id
    rating_for_movie.save

    redirect_to movies_path
  end

  def update
    @rating_for_movie = RatingForMovie.find_or_initialize_by(user_id: current_user.id, movie_id: movie_id)
    @rating_for_movie.rating = rating
    @rating_for_movie.save!

    @movies = Movie.all

    render 'movies/index'
  end

private

  def rating
    params.require(:rating)
  end

  def movie_id
    params.require(:id)
  end
end

