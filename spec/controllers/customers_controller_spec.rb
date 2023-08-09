require 'rails_helper'

RSpec.describe CustomersController do
  context '#index' do
    it 'displays all customers' do
      FactoryBot.create(:customer)
      FactoryBot.create(:customer)

      get :index

      expect(JSON.parse(response.body).count).to eql(2)
    end
  end

  context '#show' do
    it 'displays a specific customer' do
      customer = FactoryBot.create(:customer, first_name: "New customer")

      get :show, params: { id: customer.id }

      expect(JSON.parse(response.body)["first_name"]).to eq("New customer")
    end
  end

  context '#create' do
    it 'shows error message if required params are missing' do
      expect{post(:create, params: { })}.to raise_error(ActionController::ParameterMissing, /param is missing or the value is empty: customer/)
    end

    it 'shows error message for missing permitted params' do
      post :create, params: { customer: { no_first_name: "Banana" } }

      expect(response.status).to eq(422)
    end

    it 'create an customer' do
      post :create, params: { customer: { first_name: "First name", last_name: "Last name", email: "some@email.com", phone_number: "222-223-3234", registered: false, active: false} }

      expect(response.status).to eql(201)
      expect(JSON.parse(response.body)["first_name"]).to eql("First name")
    end
  end
  #
  context '#update' do
    it 'updates customer successfully' do
      customer = FactoryBot.create(:customer, first_name: "Original first name")

      put :update, params: { id: customer.id, customer: { first_name: "Updated first name" } }

      expect(response.status).to eq (200)
      expect(JSON.parse(response.body)["first_name"]).to eq("Updated first name")
    end
  end

  context '#destroy' do
    it 'delets an address successfully' do
      customer = FactoryBot.create(:customer)

      delete :destroy, params: { id: customer.id }

      expect(response.status).to eq (200)
      expect(JSON.parse(response.body)).to eq("Customer deleted successfully")
      expect{ customer.reload }.to raise_error("Couldn't find Customer with 'id'=#{customer.id}")
    end
  end
end
