class AddPostageToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :postage, :integer
  end
end
