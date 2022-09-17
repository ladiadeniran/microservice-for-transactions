# frozen_string_literal: true

class TransactionBlueprint < Blueprinter::Base
  identifier :id
  association :customer, blueprint: CustomerBlueprint
  field :input_amount do |transaction|
    {
      amount: transaction.input_amount,
      **transaction.input_currency_details
    }
  end

  field :output_amount do |transaction|
    {
      amount: transaction.output_amount,
      **transaction.output_currency_details
    }
  end

  field :transaction_date do |transaction|
    transaction.transaction_date.iso8601
  end
end
