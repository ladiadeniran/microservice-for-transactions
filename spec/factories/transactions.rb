FactoryBot.define do
  factory :transaction do
    association(:customer)
    input_amount { 1.5 }
    association(:input_currency, factory: :currency)
    output_amount { 1.5 }
    association(:output_currency, factory: :currency)
    transaction_date { "2022-09-17 01:26:18" }
  end
end
