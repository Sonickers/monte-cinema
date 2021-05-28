class MoviesController < ApplicationController
  def index
    @movies = Movies::UseCases::FetchAll.new.call
    render json: Movies::Representers::List.new(@movies).basic
  end

  def show
    @movie = Movies::UseCases::Find.new.call(id: params[:id])
    render json: Movies::Representers::Single.new(@movie).basic
  end

  def create
    @movie = Movies::UseCases::Create.new.call(params: movie_params)

    if @movie.valid?
      render json: @movie, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  def update
    @movie = Movies::UseCases::Update.new.call(id: params[:id], params: movie_params)

    if @movie.valid?
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Movies::UseCases::Delete.new.call(id: params[:id])
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :length, :genre, :poster_url)
  end
end
