class UsersController < ApplicationController
  before_action :authenticate_user, only: [:appointments, :pets]

  def create
    user = User.create(user_params)
    if user.valid? 
      render json: user
    end
  end

  def show
    user = User.find_by(id: session[:user_id])
    if user
      render json: user
    else
      render json: {error: "Not Authorized"}, status: :unauthorized
    end
  end

  def index
    render json: User.all
  end

  def appointments
    # logic to show appointments for current user
  end

  def pets
    # logic to show pets for current user
  end
  
  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def authenticate_user
    unless current_user
      render json: { error: "Not Authorized" }, status: :unauthorized
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
