class AddFromPrefectureToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :from_prefecture, :integer
  end
end
