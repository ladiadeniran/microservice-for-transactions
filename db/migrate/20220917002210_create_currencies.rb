# frozen_string_literal: true

class CreateCurrencies < ActiveRecord::Migration[7.0]
  def change
    create_table :currencies do |t|
      t.string :symbol, null: false
      t.string :name, null: false

      t.timestamps
    end
  end

  add_index :currencies, :symbol, unique: true
  add_index :currencies, :name, unique: true
end
