# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :customer, null: false, foreign_key: true
      t.float :input_amount, null: false
      t.references :input_currency, null: false, foreign_key: { to_table: :currencies }
      t.float :output_amount, null: false
      t.references :output_currency, null: false, foreign_key: { to_table: :currencies }
      t.datetime :transaction_date, null: false

      t.timestamps
    end
  end
end
