class ReviewsController < ApplicationController
  def create
    # /lists/:list_id/reviews(.:format)
    @list = List.find(params[:list_id])
    @review = Review.new(review_params)
    @review.list = @list
    if @review.save
      redirect_to list_path(@list)
    else
      render 'lists/show'
    end
  end

  def destroy
    # /reviews/:id
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to list_path(@review.list)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
