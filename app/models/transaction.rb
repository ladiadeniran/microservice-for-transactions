# frozen_string_literal: true

class Transaction < ApplicationRecord
  include AASM
  belongs_to :customer
  belongs_to :input_currency, foreign_key: :input_currency_id, class_name: 'Currency'
  belongs_to :output_currency, foreign_key: :output_currency_id, class_name: 'Currency'

  validates :customer_id, :input_currency_id, :input_amount, :output_amount, :output_currency_id, :transaction_date, presence: true

  aasm do
    state :pending, initial: true

    state :paid
    state :canceled

    event :pay do
      transitions from: :pending, to: :paid
    end

    event :cancel do
      transitions from: :pending, to: :canceled
    end
  end

  def input_currency_details
    {
      currency_name: input_currency.name,
      currency_code: input_currency.code,
      currency_symbol: input_currency.symbol
    }
  end

  def output_currency_details
    {
      currency_name: output_currency.name,
      currency_code: output_currency.code,
      currency_symbol: output_currency.symbol
    }
  end
end
