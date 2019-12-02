class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.references :condition_id, null: false, foreign_key: true
      t.references :user_id, null: false, foreign_key: true
      t.references :postage_id, null: false, foreign_key: true
      t.references :delivery_method_id, null: false, foreign_key: true
      t.references :prefecture_id, null: false, foreign_key: true
      t.references :delivery_day_id, null: false, foreign_key: true
      t.integer :price, null: false
      t.references :brand_sub_id, null: false, foreign_key: true
      t.integer :like_count, default: 0
      t.references :category_id, null: false, foreign_key: true
      t.references :profit_id, null: false, foreign_key: true
      t.references :size_id, null: false, foreign_key: true
      t.string :brand
      t.timestamps
    end
  end
end
