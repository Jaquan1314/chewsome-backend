class Api::UsersController < ApplicationController
  before_action :find_user, only: [:show, :update, :destroy]
  
  def index 
    users = User.all
    render json: users
  end

  def show
    render json: @user
  end

  def create
    user = User.create!(user_params)
    if user.valid?
      render json: user
    else
      render json: { error: 'failed to create user' }
    end
  end

  def update
    @user.update!(user_params)
    render json: @user
  end

  def destroy 
    @user.destroy!
    render json: {}
  end

  def login
    user = User.find_by(email: params[:email])
    # byebug
    if (user && user.authenticate(params[:password]))
      render json: user
    else
      render json: {errors: "invalid email"}
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.permit(:username, :email, :password)
  end
end
