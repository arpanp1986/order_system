# frozen_string_literal: true

class CustomersController < ApplicationController

  CUSTOMER_PARAMS = %i[
    first_name
    last_name
    email
    phone_number
    registered
    active
  ]
  def index
    render json: Customer.all.to_json, status: :ok
  end

  def show
    render json: Customer.find(params[:id]).to_json, status: :ok
  end

  def create
    customer = Customer.new(customer_params)
    if customer.save
      render json: customer, status: :created
    else
      render json: customer.errors, status: :unprocessable_entity
    end
  end

  def update
    customer = Customer.find(params[:id])
    customer.update!(customer_params)
    render json: customer.to_json, status: :ok
  end

  def destroy
    customer = Customer.find(params[:id])
    customer.destroy!
    render json: 'Customer deleted successfully'.to_json, status: :ok
  end


  def create_customer_and_address_by_customer_obj
    begin
      ActiveRecord::Base.transaction do
        @customer = Customer.create!(customer_params)
        @customer.addresses.create!(address_params)
      end
      render json: customer_and_address_params_presenter(@customer).to_json, status: :created
    rescue => e
      render json: e.message.to_json, status: :unprocessable_entity
    end
  end

  private

  def customer_params
    params.require(:customer).permit(CUSTOMER_PARAMS)
  end

  def address_params
    params.require(:customer).require(:address).permit(:address_1, :address_2, :state, :address_type_id, :zip_code, :country)
  end

  def address(address_params, customer)
    {
      address_1: address_params[:address_1],
      address_2: address_params[:address_2],
      state: address_params[:state],
      zip_code: address_params[:zip_code],
      address_type_id: address_params[:address_type_id],
      address_type_id: address_params[:address_type_id],
      country: address_params[:country],
      customer: customer
    }
  end

  def customer_and_address_params_presenter(customer)
    {
      customer: customer,
      addresses: customer.addresses
    }
  end
end
