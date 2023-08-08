# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    render json: User.all.to_json, status: :ok
  end

  def show
    render json: User.find(params[:id]).to_json, status: :ok
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    render json: user.to_json, status: :ok
  end

  def destroy
    user = User.find(params[:id])
    user.destroy!
    render json: 'User deleted successfully'.to_json, ststus: :ok
  end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email,
                                 :phone_number,
                                 :registered,
                                 :active)
  end
end
