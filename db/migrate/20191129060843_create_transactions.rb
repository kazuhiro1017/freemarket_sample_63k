class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.bigint :item_id, null: false, foreign_key: true
      t.bigint :seller_id, null: false, foreign_key: {to_table: :users}
      t.bigint :buyer_id, null: false, foreign_key: {to_table: :users}
      t.bigint :transaction_state_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
