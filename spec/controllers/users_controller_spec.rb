require 'rails_helper'

RSpec.describe UsersController do


  context '#index' do
    it 'displays all users' do
      FactoryBot.create(:user)
      FactoryBot.create(:user)

      get :index

      expect(JSON.parse(response.body).count).to eql(2)
    end
  end

  context '#show' do
    it 'displays a specific user' do
      user = FactoryBot.create(:user, first_name: "New user")

      get :show, params: { id: user.id }

      expect(JSON.parse(response.body)["first_name"]).to eq("New user")
    end
  end

  context '#create' do
    it 'shows error message if required params are missing' do
      expect{post(:create, params: { })}.to raise_error(ActionController::ParameterMissing, /param is missing or the value is empty: user/)
    end

    it 'shows error message for missing permitted params' do
      post :create, params: { user: { no_first_name: "Banana" } }

      expect(response.status).to eq(422)
    end

    it 'create an user' do
      post :create, params: { user: { first_name: "First name", last_name: "Last name", email: "some@email.com", phone_number: "222-223-3234", registered: false, active: false} }

      expect(response.status).to eql(201)
      expect(JSON.parse(response.body)["first_name"]).to eql("First name")
    end
  end
  #
  context '#update' do
    it 'updates user successfully' do
      user = FactoryBot.create(:user, first_name: "Original first name")

      put :update, params: { id: user.id, user: { first_name: "Updated first name" } }

      expect(response.status).to eq (200)
      expect(JSON.parse(response.body)["first_name"]).to eq("Updated first name")
    end
  end

  context '#destroy' do
    it 'delets an address successfully' do
      user = FactoryBot.create(:user)

      delete :destroy, params: { id: user.id }

      expect(response.status).to eq (200)
      expect(JSON.parse(response.body)).to eq("User deleted successfully")
      expect{ user.reload }.to raise_error("Couldn't find User with 'id'=#{user.id}")
    end
  end
end
