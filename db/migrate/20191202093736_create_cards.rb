class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.references :user, foreign_key: true
      t.string     :card_number, null: false
      t.integer    :expiry_date_year, null: false
      t.integer    :expiry_date_month, null: false
      t.integer    :security_code, null: false
      t.timestamps
    end
  end
end
