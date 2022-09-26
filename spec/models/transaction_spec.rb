require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context 'initial transaction state is created' do
    let!(:transaction){ create(:transaction) }
    it 'new transaction state' do
      expect(transaction.pending?).to be true
    end
  end

  context 'paid' do
    let!(:transaction){ create(:transaction) }
    it 'new transaction state' do
      expect(transaction.pending?).to be true
      transaction.pay!
      expect(transaction.paid?).to be true
      expect(transaction.pending?).to be false
    end
  end

  context 'canceled' do
    let!(:transaction){ create(:transaction) }
    it 'new transaction state' do
      expect(transaction.pending?).to be true
      transaction.cancel!
      expect(transaction.canceled?).to be true
      expect(transaction.pending?).to be false
    end
  end
end

