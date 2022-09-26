
# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'V1::TransactionsController', type: :request do
  describe '#index' do
    context 'when there are no transactions' do
      it 'returns an empty array' do
        get v1_transactions_path
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
        get v1_transactions_path
        expect(response).to have_http_status(:ok)
        body = JSON.parse(response.body)
        expect(body['transactions'].size).to eq 3
      end
    end

    context 'pagination' do

    end
  end

  describe '#create' do
    context 'with valid attributes' do
      let!(:customer){ create(:customer) }
      let!(:input_currency){ create(:currency) }
      let!(:output_currency){ create(:currency) }
      let(:valid_params) do
        {
          customer_id: customer.id,
          input_amount: 100,
          output_amount: 150,
          input_currency_id: input_currency.id,
          output_currency_id: output_currency.id,
          transaction_date: "2022-09-17 01:26:18",
          aasm_state: 'paid'
        }
      end

      it 'creates the transaction in the db' do
        expect do
          post v1_transactions_path, params: { transaction: valid_params }
        end.to change(Transaction, :count).by(1)
        expect(response).to have_http_status(:created)
        transaction = JSON.parse(response.body)
        expect(transaction['input_amount']['amount']).to eq 100
        expect(transaction['output_amount']['amount']).to eq 150
        expect(transaction['input_amount']['currency_name']).to eq input_currency.name
        expect(transaction['output_amount']['currency_name']).to eq output_currency.name
        expect(transaction['state']).to eq 'paid'
      end
    end

    context 'with invalid attributes' do
      let!(:customer){ create(:customer) }
      let!(:input_currency){ create(:currency) }
      let!(:output_currency){ create(:currency) }
      let(:invalid_params) do
        {
          customer_id: customer.id,
          input_amount: 100,
          output_amount: 150,
          output_currency_id: output_currency.id,
        }
      end

      it 'does not create the' do
        expect do
          post v1_transactions_path, params: { transaction: invalid_params }
        end.to change(Transaction, :count).by(0)
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe '#update' do
    context 'when the transaction exists' do
      let!(:transaction){ create(:transaction, input_amount: 100, output_amount: 200) }
      let!(:updated_params){ {input_amount: 2000, output_amount: 3000} }

      it 'returns the transaction' do
        expect do
          put v1_transaction_path(transaction), params: { transaction: updated_params }
        end.to change(Transaction, :count).by(0)
        expect(response).to have_http_status(:ok)
        returned_transaction = JSON.parse(response.body)
        expect(returned_transaction['id']).to eq transaction.id
        transaction.reload
        expect(transaction.input_amount).to eq 2000
        expect(transaction.output_amount).to eq 3000
      end
    end

    context 'when the transaction id is invalid' do

      it 'returns as bad_request' do
        put v1_transaction_path(id: 2)
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe '#show' do
    context 'when the transaction exists' do
      let!(:transaction){ create(:transaction) }

      it 'returns the transaction' do
        get v1_transaction_path(transaction)
        expect(response).to have_http_status(:ok)
        returned_transaction = JSON.parse(response.body)
        expect(returned_transaction['id']).to eq transaction.id
      end
    end

    context 'when the transaction id is invalid' do

      it 'returns as bad_request' do
        get v1_transaction_path(id: 2)
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe '#destroy' do
    context 'when the transaction exists' do
      let!(:transaction){ create(:transaction) }

      it 'deletes the transaction' do
        expect do
          delete v1_transaction_path(transaction)
        end.to change(Transaction, :count).by(-1)
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when the transaction id is invalid' do

      it 'returns as bad_request' do
        delete v1_transaction_path(id: 2)
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
