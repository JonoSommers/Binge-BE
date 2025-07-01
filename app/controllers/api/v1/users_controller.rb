class Api::V1::UsersController < ApplicationRecord
  def create
    render json: UserSerializer.new(User.create!(user_params)), status: :created
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation)
  end
end
