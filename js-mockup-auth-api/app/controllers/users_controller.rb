class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: user, status: :ok
    else
      render json: { errors: "email or passsword mismatch" }, status: :bad_request
    end
  end

  def current_user
    user = User.find_by(id: params[:user_id])

    if user
      render json: user, status: :ok
    else
      render json: { errors: "Not Logged In" }, status: :bad_request
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
