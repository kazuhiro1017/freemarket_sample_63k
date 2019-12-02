class CreateConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions do |t|
      t.string :condition, null: false, unique: true
      t.timestamps
    end
  end
end
