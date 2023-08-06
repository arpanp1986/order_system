class Address < ApplicationRecord
  include ActiveModel::Validations
  validates :address_1, presence: true
  validates :state, presence: true
  validates :zip_code, length: {minimum: 5, maximum: 9}

  belongs_to :user
  belongs_to :address_type
  has_paper_trail
end
