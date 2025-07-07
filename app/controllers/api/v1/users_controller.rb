class Api::V1::UsersController < ApplicationController
  def create
    new_user = User.create!(user_params)
    render json: UserSerializer.new(new_user), status: :created
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
