class User < ApplicationRecord

  include ActiveModel::Validations
  validates :email, presence: true, email: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true

  has_many :addresses


  # def add_address(address_params)
  #   address_params = { address_1: address_params[:address_1],
  #                      state: address_params[:state],
  #                      zip_code: address_params[:zip_code],
  #                      user: @user
  #                     }
  #                     binding.break
  #   address = Address.new(address_params)
  #   address.save!
  # end
end
