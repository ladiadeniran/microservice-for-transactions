 # frozen_string_literal: true

class UpdateTransactionService
  attr_reader :valid_params, :transaction

  def initialize(transaction, valid_params)
    @valid_params = valid_params
    @transaction = transaction
  end

  def call
    @transaction.update!(valid_params)
    transaction
  end
end
