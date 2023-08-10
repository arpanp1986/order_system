# frozen_string_literal: true

class Customer < ApplicationRecord
  include ActiveModel::Validations
  validates :email, presence: true, email: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  has_many :addresses, dependent: :destroy

  def add_address(attrs)
    begin
      Address.create!(attrs)
    rescue  ActiveRecord::RecordInvalid => e
      raise e
    end
  end
end
