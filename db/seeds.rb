# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#  Customer List
customer1 = Customer.find_or_create_by!(email: 'user1@gmail.com')
customer2= Customer.find_or_create_by!(email: 'user2@gmail.com')
customer3 = Customer.find_or_create_by!(email: 'user3@gmail.com')

currency1 = Currency.find_or_create_by!(name: 'dollar', code: 'USD', symbol: '$')
currency2 = Currency.find_or_create_by!(name: 'euro', code: 'Euro', symbol: 'E')
currency3 = Currency.find_or_create_by!(name: 'naira', code: 'Naira', symbol: 'N')

Transaction.find_or_create_by!(
  customer_id: customer1.id,
  input_amount: 10,
  output_amount: 6550,
  input_currency_id: currency1.id,
  output_currency_id: currency3.id,
  transaction_date: "2022-09-17 01:26:18"
)
Transaction.find_or_create_by!(
  customer_id: customer2.id,
  input_amount: 17,
  output_amount: 8900,
  input_currency_id: currency2.id,
  output_currency_id: currency3.id,
  transaction_date: "2022-09-17 01:26:18"
)

Transaction.find_or_create_by!(
  customer_id: customer3.id,
  input_amount: 99,
  output_amount: 100,
  input_currency_id: currency3.id,
  output_currency_id: currency1.id,
  transaction_date: "2022-09-17 01:26:18"
)