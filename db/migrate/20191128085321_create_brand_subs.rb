class CreateBrandSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :brand_subs do |t|
      t.string :name, null: false, unique: true
      t.bigint :brand_main_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
