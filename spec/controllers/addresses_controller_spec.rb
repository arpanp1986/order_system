require 'rails_helper'

RSpec.describe AddressesController do


  context '#index' do
    before do
      allow(AddressType).to receive(:find).and_return(double("AddressType"))
    end
    it 'displays all addresses' do
      FactoryBot.create(:address)
      FactoryBot.create(:address, state: "CA")

      get :index

      expect(JSON.parse(response.body).count).to eql(2)
    end
  end

  context '#show' do
    it 'displays a specific address' do
      address = FactoryBot.create(:address, address_1: "Home sweet home")

      get :show, params: { id: address.id }

      expect(JSON.parse(response.body)["address_1"]).to eq("Home sweet home")
    end
  end

  context '#create' do
    before do
      allow(AddressType).to receive(:find).and_return(double("AddressType"))
      allow(User).to receive(:find).and_return(double("User"))
    end
    it 'shows error message if required params are missing' do
      expect{post(:create, params: { })}.to raise_error(ActionController::ParameterMissing, /param is missing or the value is empty: address/)
    end

    it 'shows error message for missing permitted params' do
      post :create, params: { address: { no_address_1: "Banana" } }

      expect(response.status).to eq(422)
    end

    it 'create an addres' do
      user = FactoryBot.create(:user)
      address_type = AddressType.create(name: "Some address type")

      post :create, params: { address: { address_1: "New home", address_2: "north", state: "IL", zip_code: 60444, user_id: user.id, address_type_id: address_type.id, country: "US"} }

      expect(response.status).to eql(201)
      expect(JSON.parse(response.body)["address_1"]).to eql("New home")
    end
  end

  context '#update' do
    it 'updates a vegetable successfully' do
      address = FactoryBot.create(:address, address_1: "Original address_1")

      put :update, params: { id: address.id, address: { address_1: "Updated address_1" } }

      expect(response.status).to eq (200)
      expect(JSON.parse(response.body)["address_1"]).to eq("Updated address_1")
    end
  end

  context '#destroy' do
    it 'delets a vegetable successfully' do
      address = FactoryBot.create(:address)

      delete :destroy, params: { id: address.id }

      expect(response.status).to eq (200)
      expect(JSON.parse(response.body)).to eq("Address deleted successfully")
      expect{ address.reload }.to raise_error("Couldn't find Address with 'id'=#{address.id}")
    end
  end
end
