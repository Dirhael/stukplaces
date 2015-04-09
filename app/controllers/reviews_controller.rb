class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: [:edit, :update, :destroy]

  def edit
  end

  def create
    @review = current_user.reviews.new(review_params)
    if @review.save
      redirect_to place_path(@review.place), notice: 'Review created successfully.'
    else
      redirect_to place_path(@review.place), notice: 'Something went wrong.'
    end
  end

  def update
    if @review.update(review_params)
      redirect_to place_path(@review.place), notice: 'Review updated successfully.'
    else
      redirect_to place_path(@review.place), notice: 'Something went wrong.'
    end
  end

  def destroy
    @review.destroy
    redirect_to place_path(@review.place), notice: 'Review successfully destroyed.'
  end

  private
  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:place_id, :content)
  end

end
