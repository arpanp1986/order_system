require 'rails_helper'

RSpec.describe Customer, type: :model do

  let(:attrs_without_address_1) do {
    address_2: "address_2",
    state: "state",
    zip_code: "zip_code",
    address_type_id: AddressType.create(name: "shipping").id,
    country: "US",
  }
  end

  let(:attrs) do {
    address_1: "address_1",
    address_2: "address_2",
    state: "state",
    zip_code: "zip_code",
    address_type_id: AddressType.create(name: "shipping").id,
    country: "US",
  }
  end

  describe 'validates attributes of customer' do
    it 'validates correct format of email' do
      expect{ FactoryBot.create(:customer, email: "emailwithincorrectformat") }.to raise_error(ActiveRecord::RecordInvalid, /Validation failed: Email is invalid/)
    end
    it 'validates presence of email' do
      expect{ FactoryBot.create(:customer, email: nil) }.to raise_error(ActiveRecord::RecordInvalid, /Validation failed: Email can't be blank, Email is invalid/)
    end

    it 'validates presence of first name' do
      expect{ FactoryBot.create(:customer, first_name: nil) }.to raise_error(ActiveRecord::RecordInvalid, /Validation failed: First name can't be blank/)
    end

    it 'validates presence of last name' do
      expect{ FactoryBot.create(:customer, last_name: nil) }.to raise_error(ActiveRecord::RecordInvalid, /Validation failed: Last name can't be blank/)
    end

    it 'validates presence of phone number' do
      expect{ FactoryBot.create(:customer, phone_number: nil) }.to raise_error(ActiveRecord::RecordInvalid, /Validation failed: Phone number can't be blank/)
    end

    it 'creates a customer successfully with all required attributes' do
      expect(FactoryBot.create(:customer)).to an_instance_of(Customer)
    end
  end

  describe 'validates #add_address' do
    it 'validates and raises the error for missing params' do
      @customer = FactoryBot.create(:customer)
      expect{ @customer.add_address(attrs_without_address_1.merge(customer: @customer))}.to raise_error(ActiveRecord::RecordInvalid, /Validation failed: Address 1 can't be blank/)
    end

    it 'successfully creates a record for valid address' do
      @customer = FactoryBot.create(:customer)
      expect(@customer.add_address(attrs.merge(customer: @customer))).to an_instance_of(Address)
    end
  end
end
