# frozen_string_literal: true

FactoryBot.define do
  factory :currency do
    symbol { "$" }
    name { "dollar" }
  end
end
