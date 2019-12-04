class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname,           null: false
      t.string :email,              null: false, default: ""
      t.string :password_digest,    null: false, default: ""
      t.string :first_name,         null: false
      t.string :last_name,          null: false
      t.string :first_name_kana,    null: false
      t.string :last_name_kana,     null: false
      t.date :birthday,             null: false
      t.string :phone_number,       null: false
      t.timestamps
    end
  end
end
