# frozen_string_literal: true

class CustomersController < ApplicationController
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
    render json: 'Customer deleted successfully'.to_json, ststus: :ok
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name,
                                 :last_name,
                                 :email,
                                 :phone_number,
                                 :registered,
                                 :active)
  end
end
