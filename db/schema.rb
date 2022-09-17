# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_17_002618) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currencies", force: :cascade do |t|
    t.string "symbol", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_currencies_on_name", unique: true
    t.index ["symbol"], name: "index_currencies_on_symbol", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.float "input_amount", null: false
    t.bigint "input_currency_id", null: false
    t.float "output_amount", null: false
    t.bigint "output_currency_id", null: false
    t.datetime "transaction_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_transactions_on_customer_id"
    t.index ["input_currency_id"], name: "index_transactions_on_input_currency_id"
    t.index ["output_currency_id"], name: "index_transactions_on_output_currency_id"
  end

  add_foreign_key "transactions", "currencies", column: "input_currency_id"
  add_foreign_key "transactions", "currencies", column: "output_currency_id"
  add_foreign_key "transactions", "customers"
end
