class RemoveConditionIdFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :condition_id, :bigint
  end
end
