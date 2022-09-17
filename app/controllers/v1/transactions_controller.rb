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
    end

    def post
    end

    def update
    end

    def delete
    end

    private

    def collection
      @collection ||= Transaction.all.order(:transaction_date)
    end

    def blueprinter
      TransactionBlueprint
    end
  end
end
