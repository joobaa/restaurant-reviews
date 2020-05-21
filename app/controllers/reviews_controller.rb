class ReviewsController < ApplicationController
  def new
    # Find the restaurant instance from the id in the params
    @restaurant = Restaurant.find(params[:restaurant_id])
    # Create a blank review for the empty form
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    # Associate my review together with my restaurant
    @review.restaurant = @restaurant
    if @review.save
      # Success
      redirect_to restaurant_path(@restaurant)
    else
      # Failure
      render :new
    end
  end

  def destroy
    # NOT NESTED
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
