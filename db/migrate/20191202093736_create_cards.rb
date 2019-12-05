class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.references :user, foreign_key: true
      t.string     :card_number, null: false
      t.date       :expiry_date, null: false
      t.integer    :security_code, null: false
      t.timestamps
    end
  end
end
