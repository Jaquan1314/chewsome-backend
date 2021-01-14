class Api::ReviewsController < ApplicationController
  def index 
    reviews = Review.all
    render json: reviews
  end

  def new
    review = Review.new
    render json: review
  end

  def show
    review = Review.find(params[:id])
    render json: review
  end

  def create
    review = Review.create!(review_params)
    if review.valid?
      render json: review
    else
      render json: { error: 'failed to create review' }
    end
  end

  def update
    review = Review.find(params[:id])
    review.update!(review_params)
    render json: review
  end

  def destroy 
    review = Review.find(params[:id])
    review.destroy!
    render json: {}
  end

  private

  def review_params
    params.permit(:user_id, :restaurant_id, :rating, :text)
  end
end
