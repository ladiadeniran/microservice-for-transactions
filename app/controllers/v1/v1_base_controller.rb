# frozen_string_literal: true

module V1
  class V1BaseController < ApplicationController
    include Pagy::Backend
    include ErrorHandler
    include Pagination
  end
end