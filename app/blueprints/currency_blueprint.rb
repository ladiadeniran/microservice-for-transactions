# frozen_string_literal: true

class CurrencyBlueprint < Blueprinter::Base
  identifier :id
  fields :name, :code, :symbol
end
