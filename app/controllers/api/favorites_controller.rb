class Api::FavoritesController < ApplicationController
  def index
    favorites = Favorite.all
    render json: favorites
  end

  def show 
    favorite = Favorite.find(params[:id])
    render json: favorite
  end

  def create
    favorite = Favorite.create!(favorite_params)
    if favorite.valid?
      render json: favorite
    else
      render json: { error: 'failed to create favorite' }
    end
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy!
    render json: {}
  end

  def favorite_params
    params.permit(:user_id, :restaurant_id)
  end
end
