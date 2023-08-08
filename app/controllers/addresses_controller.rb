# frozen_string_literal: true

class AddressesController < ApplicationController
  def index
    render json: Address.all.to_json, status: :ok
  end

  def show
    render json: Address.find(params[:id]).to_json, status: :ok
  end

  def create
    address = Address.new(address_params)
    if address.save
      render json: address, status: :created
    else
      render json: address.errors, status: :unprocessable_entity
    end
  end

  def update
    address = Address.find(params[:id])
    address.update!(address_params)
    render json: address.to_json, status: :ok
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy!
    render json: 'Address deleted successfully'.to_json, ststus: :ok
  end

  private

  def address_params
    params.require(:address).permit(:address_1,
                                    :address_2,
                                    :state,
                                    :address_type_id,
                                    :zip_code,
                                    :user_id,
                                    :country)
  end
end
