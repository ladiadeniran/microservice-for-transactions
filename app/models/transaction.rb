# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :customer
  belongs_to :input_currency, foreign_key: :input_currency_id, class_name: 'Currency'
  belongs_to :output_currency, foreign_key: :output_currency_id, class_name: 'Currency'

  validates :customer_id, :input_currency_id, :input_amount, :output_amount, :output_currency_id, :transaction_date, presence: true
end
