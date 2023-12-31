# frozen_string_literal: true

class Customer < ApplicationRecord
  include ActiveModel::Validations
  validates :email, presence: true, email: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  has_many :addresses, dependent: :destroy
end
