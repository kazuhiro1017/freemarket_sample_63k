class AddSizeToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :size, :integer
  end
end
