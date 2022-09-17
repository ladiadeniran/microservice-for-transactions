# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    sequence(:email){ |n| "#{Faker::Internet.email}-#{n}" }
  end
end
