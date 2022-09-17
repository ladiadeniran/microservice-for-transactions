# frozen_string_literal: true

module Pagination
  extend ActiveSupport::Concern

  def pagy_render(collection)
    vars = {
      page: params[:page] || 1,
      items: params[:per_page] || 30
    }
    pagy, records = pagy(collection, vars)
    pagy_data = {
      page: pagy.page,
      items: pagy.items,
      totalPages: pagy.pages
    }
    [records, pagy_data]
  end

  def page_data
    data, pagy_data = pagy_render(collection)
    serialized_data = blueprinter.render_as_hash(data)
    { data: serialized_data, pagy_data: pagy_data }
  end
end
