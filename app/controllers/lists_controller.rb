class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @movie = Movie.new
  end

  def create
    @list = List.new(list_params)
    @list.save

    redirect_to lists_path
  end

  def update
    # @list = list.find(params[:id])
    @restaurant.update(list_params)
    redirect_to lists_path
  end

  def destroy
    # @list = list.find(params[:id])
    @list.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
