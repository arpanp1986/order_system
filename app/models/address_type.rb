# frozen_string_literal: true

class AddressType < ApplicationRecord
  has_many :addresses
end
