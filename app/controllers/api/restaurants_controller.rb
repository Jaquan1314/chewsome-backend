# require 'rest-client'
class Api::RestaurantsController < ApplicationController
  def index
    # byebug
    restaurants = Restaurant.all
    # response = RestClient::Request.execute(
    #   method: "GET",
    #   url: "https://api.yelp.com/v3/businesses/search?term=delis&location=nyc&sort_by=rating",
    #   headers: { Authorization: "Bearer #{ENV['YELP_API_KEY']}" },
    # )
    # restaurants = JSON.parse(response)
    render json: restaurants
  end

  def show 
    restaurant = Restaurant.find(params[:id])
    render json: restaurant
  end
end
