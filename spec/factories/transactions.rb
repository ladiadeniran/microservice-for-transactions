FactoryBot.define do
  factory :transaction do
    association(:customer)
    input_amount { 1.5 }
    input_currency { nil }
    output_amount { 1.5 }
    output_currency { nil }
    transaction_date { "2022-09-17 01:26:18" }
  end
end
