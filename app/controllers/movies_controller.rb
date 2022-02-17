class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save

    redirect_to movie_path(@movie)
  end

  def update
    # @movie = Movie.find(params[:id])
    @restaurant.update(movie_params)
    redirect_to movie_path(@movie)
  end

  def destroy
    # @movie = Movie.find(params[:id])
    @movie.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
