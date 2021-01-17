class Api::ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :update, :destroy]
  
  def index 
    reviews = Review.all
    render json: reviews
  end

  def show
    render json: @review
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
    @review.update!(review_params)
    render json: @review
  end

  def destroy 
    @review.destroy!
    render json: {}
  end

  private
  
  def find_review
    @review = Review.find(params[:id])
  end
  
  def review_params
    params.permit(:user_id, :restaurant_id, :rating, :text)
  end
end
