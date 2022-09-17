# frozen_string_literal: true

class CreateTransactionService
  attr_reader :valid_params

  def initialize(valid_params)
    @valid_params = valid_params
  end

  def call
    Transaction.create!(valid_params)
  end
end
