class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :price, null: false
      t.references :brand_sub, null: false, foreign_key: true
      t.integer :like_count, default: 0
      t.references :category, null: false, foreign_key: true
      t.string :brand
      t.timestamps
    end
  end
end
