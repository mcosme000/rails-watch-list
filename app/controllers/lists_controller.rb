require 'open-uri'

class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def top_rated
    url = 'http://tmdb.lewagon.com/movie/top_rated'
    @data = JSON.parse(URI.open(url).read)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @review = Review.new
    @list = List.find(params[:id])
    @movies = Movie.all
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
