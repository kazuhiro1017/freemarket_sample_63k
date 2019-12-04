class RemovePostageIdFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :postage_id, :bigint
  end
end
