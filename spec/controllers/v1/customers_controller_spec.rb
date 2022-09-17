# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'V1#CustomersController', type: :request do
  describe '#index' do
    context 'when there are no customers' do
      it 'returns an empty array' do
        get v1_customers_path
        expect(response).to have_http_status(:ok)
        body = JSON.parse(response.body)
        expect(body['customers']).to eq []
      end
    end

    context 'when there are transactions' do
      let!(:customer1){ create(:customer) }
      let!(:customer2){ create(:customer) }
      let!(:customer3){ create(:customer) }

      it 'returns the array of customers' do
        get v1_customers_path
        expect(response).to have_http_status(:ok)
        body = JSON.parse(response.body)
        expect(body['customers'].size).to eq 3
      end
    end

    context 'pagination' do
    end
  end
end