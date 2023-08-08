require 'rails_helper'

RSpec.describe Address do

  before(:all) do
    AddressType.create(name: "shipping")
  end

  describe 'validates attributes of address' do
    it 'validates presence of address 1' do
      expect{ FactoryBot.create(:address, user: FactoryBot.create(:user), address_1: nil) }.to raise_error(ActiveRecord::RecordInvalid, /Validation failed: Address 1 can't be blank/)
    end

    it 'validates presence of state' do
      expect{ FactoryBot.create(:address, state: nil) }.to raise_error(ActiveRecord::RecordInvalid, /Validation failed: State can't be blank/)
    end

    it 'validates presence of zip code' do
      expect{ FactoryBot.create(:address, zip_code: nil) }.to raise_error(ActiveRecord::RecordInvalid, /Validation failed: Zip code is too short/)
    end

    it 'validates length of zip code' do
      expect{ FactoryBot.create(:address, zip_code: "1234567890") }.to raise_error(ActiveRecord::RecordInvalid, /Validation failed: Zip code is too long/)
    end

  end
end
