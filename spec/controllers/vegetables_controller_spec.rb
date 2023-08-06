require 'rails_helper'

RSpec.describe VegetablesController do

  context '#index' do
    it 'displays all vegetables' do
      vegetable1 = FactoryBot.create(:vegetable)
      vegetable2= FactoryBot.create(:vegetable, name: "Pineapple")

      get :index

      expect(JSON.parse(response.body).count).to eql(2)
    end
  end

  context '#show' do
    it 'displays specific vegetable' do
      vegetable = FactoryBot.create(:vegetable)

      get :show, params: { id: vegetable.id }

      expect(JSON.parse(response.body)["id"]).to eq(vegetable.id)
      expect(JSON.parse(response.body)["name"]).to eq("Mango")
    end
  end

  context '#create' do
    it 'shows error message if required params are missing' do
      expect{post(:create, params: { })}.to raise_error(ActionController::ParameterMissing, /param is missing or the value is empty: vegetable/)
    end

    it 'shows error message for missing permitted params' do
      post :create, params: { vegetable: { kind: "Banana", price: 22, available: false } }

      expect(response.status).to eq(422)
      expect(JSON.parse(response.body)["name"]).to eq(["can't be blank"])
    end


    it 'create a vegetable' do
      post :create, params: { vegetable: { name: "Banana", price: 22, available: false } }

      expect(response.status).to eql(200)
      expect(JSON.parse(response.body)["name"]).to eql("Banana")
    end
  end

  context '#update' do
    it 'updates a vegetable successfully' do
      vegetable = FactoryBot.create(:vegetable, name: "Original Pineapple")

      put :update, params: { id: vegetable.id, vegetable: { name: "Updated Pineapple", price: 22, available: false } }

      expect(response.status).to eq (200)
      expect(JSON.parse(response.body)["name"]).to eq("Updated Pineapple")
    end
  end

  context '#destroy' do
    it 'delets a vegetable successfully' do
      vegetable = FactoryBot.create(:vegetable, name: "Delete Pineapple")

      delete :destroy, params: { id: vegetable.id }

      expect(response.status).to eq (200)
      expect(JSON.parse(response.body)).to eq("Record deleted successfully")
      expect{ vegetable.reload }.to raise_error("Couldn't find Vegetable with 'id'=#{vegetable.id}")
    end
  end
end
