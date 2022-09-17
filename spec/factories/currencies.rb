# frozen_string_literal: true

FactoryBot.define do
  factory :currency do
    sequence(:symbol) { |n| Faker::Currency.symbol + "#{n}"}
    sequence(:name) { |n| Faker::Currency.name + "#{n}" }
    sequence(:code) { |n| Faker::Currency.code + "#{n}" }
  end
end
