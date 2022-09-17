# frozen_string_literal: true

module ErrorHandler
  extend ActiveSupport::Concern

  module ErrorHandler
  extend ActiveSupport::Concern
  included do
    rescue_from ActiveRecord::RecordNotFound do |error|
      invalid_request(error.to_s)
    end

    rescue_from NoMethodError do |error|
      invalid_request(error.to_s)
    end

    rescue_from ActionController::ParameterMissing do |error|
      invalid_request(error.to_s)
    end

    def invalid_request(error_message, status: :bad_request)
      render json: error_message.to_json, status: status
    end
  end
end

end