class CreateTransactionStates < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_states do |t|
      t.string :state, null: false
      t.timestamps
    end
  end
end
