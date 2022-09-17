# frozen_string_literal: true

module V1
  class CurrenciesController < V1BaseController
    def index
      if collection.blank?
        render json: { currencies: [] }
        return
      end

      display_data = page_data
      render json: { currencies: display_data[:data], **display_data[:pagy_data] }
    end

    private

    def collection
      @collection ||= Currency.all
    end

    def blueprinter
      CurrencyBlueprint
    end
  end
end
