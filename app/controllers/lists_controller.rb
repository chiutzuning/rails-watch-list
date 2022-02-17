class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save

    redirect_to list_path(@list)
  end

  def update
    # @list = list.find(params[:id])
    @restaurant.update(list_params)
    redirect_to list_path(@list)
  end

  def destroy
    # @list = list.find(params[:id])
    @list.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:title, :overview, :poster_url, :rating)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
