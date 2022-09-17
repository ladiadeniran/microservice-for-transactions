# frozen_string_literal: true

module V1
  class CustomersController < V1BaseController
    def index
      if collection.blank?
        render json: { customers: [] }
        return
      end

      display_data = page_data
      render json: { customers: display_data[:data], **display_data[:pagy_data] }
    end

    private

    def collection
      @collection ||= Customer.all
    end

    def blueprinter
      CustomerBlueprint
    end
  end
end
