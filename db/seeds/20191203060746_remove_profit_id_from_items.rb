class RemoveProfitIdFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :profit_id, :bigint
  end
end
