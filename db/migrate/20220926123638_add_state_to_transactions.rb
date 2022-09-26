# frozen_string_literal: true

class AddStateToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :aasm_state, :string
  end
end
