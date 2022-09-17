# frozen_string_literal: true

module V1
  class TransactionsController < V1BaseController
    def index
      if collection.blank?
        render json: { transactions: [] }
        return
      end

      display_data = page_data
      render json: { transactions: display_data[:data], **display_data[:pagy_data] }
    end

    def show
      render json: blueprinter.render(transaction)
    end

    def create
      new_transaction = CreateTransactionService.new(transaction_params).call
      render json: blueprinter.render(new_transaction), status: :created
    end

    def update
      updated_transaction = UpdateTransactionService.new(transaction, transaction_params).call
      render json: blueprinter.render(updated_transaction)
    end

    def destroy
      transaction.destroy!
      render status: :no_content
    end

    private

    def collection
      @collection ||= Transaction.all.order(:transaction_date).includes(:customer, :input_currency, :output_currency)
    end

    def blueprinter
      TransactionBlueprint
    end

    def transaction
      @transaction ||= Transaction.find(params[:id])
    end

    def transaction_params
      params.require(:transaction).permit(
        :customer_id,
        :input_amount,
        :input_currency_id,
        :output_amount,
        :output_currency_id,
        :transaction_date
      )
    end
  end
end
