# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :customer
  belongs_to :input_currency, foreign_key: :input_currency_id, class: 'Currency'
  belongs_to :output_currency, foreign_key: :input_currency_id, class: 'Currency'
end
