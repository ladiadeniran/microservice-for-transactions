
# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'V1::TransactionsController', type: :request do
  describe '#index' do
    context 'when there are no transactions' do
      it 'returns an empty array' do
        get v1_transactions_url
        expect(response).to have_http_status(:ok)
        body = JSON.parse(response.body)
        expect(body['transactions']).to eq []
      end
    end

    context 'when there are transactions' do
      let!(:transaction1){ create(:transaction) }
      let!(:transaction2){ create(:transaction) }
      let!(:transaction3){ create(:transaction) }

      it 'returns the array of transactions' do
        get v1_transactions_url
        expect(response).to have_http_status(:ok)
        body = JSON.parse(response.body)
        expect(body['transactions'].size).to eq 3
      end
    end

    context 'pagination' do

    end
  end
end
