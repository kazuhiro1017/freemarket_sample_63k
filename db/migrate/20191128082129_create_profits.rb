class CreateProfits < ActiveRecord::Migration[5.2]
  def change
    create_table :profits do |t|
      t.integer :profit, null: false
      t.integer :delivery_cost, null: false
      t.timestamps
    end
  end
end
