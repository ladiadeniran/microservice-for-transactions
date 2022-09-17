# frozen_string_literal: true

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'V1#CurrenciesController', type: :request do
  describe '#index' do
    context 'when there are no currencies' do
      it 'returns an empty array' do
        get v1_currencies_path
        expect(response).to have_http_status(:ok)
        body = JSON.parse(response.body)
        expect(body['currencies']).to eq []
      end
    end

    context 'when there are transactions' do
      let!(:currency1){ create(:currency) }
      let!(:currency2){ create(:currency) }
      let!(:currency3){ create(:currency) }

      it 'returns the array of currencies' do
        get v1_currencies_path
        expect(response).to have_http_status(:ok)
        body = JSON.parse(response.body)
        expect(body['currencies'].size).to eq 3
      end
    end

    context 'pagination' do
    end
  end
end