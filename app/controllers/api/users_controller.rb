class Api::UsersController < ApplicationController
  def index 
    users = User.all
    render json: users
  end

  def new
    user = User.new
    render json: user
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.create!(user_params)
    if user.valid?
      render json: user
    else
      render json: { error: 'failed to create user'}
    end
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    render json: user
  end

  def destroy 
    user = User.find(params[:id])
    user.destroy!
    render json: {}
  end

  private
  
  def user_params
    params.permit(:username, :email, :password)
  end
end
