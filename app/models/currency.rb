# frozen_string_literal: true

class Currency < ApplicationRecord
  validates :name, :symbol, presence: true, uniqueness: { case_sensitive: false }
end
