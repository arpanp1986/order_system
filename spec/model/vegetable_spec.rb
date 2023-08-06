# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vegetable do

  describe '#create' do

    let(:vegetable_params) { { "name": "Pineapple", "price": 20, "available": true } }
    let(:vegetable_params_without_name) { { "price": 20, "available": true } }
    let(:vegetable_params_without_price) { { "name": "Pineapple", "available": true } }
    let(:vegetable_params_without_availability) { { "name": "Pineapple", "price": 20 } }



    context 'verify field validations' do
      it "doesn't allow empty name" do
        subject = Vegetable.create(vegetable_params_without_name)
        expect{subject.save!}.to raise_error(ActiveRecord::RecordInvalid, /Validation failed: Name can't be blank/)
      end

      it "doesn't allow empty price" do
        subject = Vegetable.create(vegetable_params_without_price)
        expect{subject.save!}.to raise_error(ActiveRecord::RecordInvalid, /Validation failed: Price can't be blank/)
      end

      it "doesn't allow empty availability" do
        subject = Vegetable.create(vegetable_params_without_availability)
        expect{subject.save!}.to raise_error(ActiveRecord::RecordInvalid, /Validation failed: Available is not included in the list/)
      end
    end

    it 'Creates vegetable successfully' do
      subject = FactoryBot.create(:vegetable)

      expect(subject.name).to eq("Mango")
      expect(subject.price).to eq(200)
      expect(subject.available).to eq(true)
      expect(subject).to be_an_instance_of(Vegetable)
    end

    it 'Creates vegetable successfully with QR code attached to it' do
      expect { FactoryBot.create(:vegetable) }.to change(ActiveStorage::Attachment, :count).by(1)
    end
  end
end
