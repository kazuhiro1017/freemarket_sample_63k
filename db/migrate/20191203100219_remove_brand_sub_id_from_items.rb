class RemoveBrandSubIdFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :brand_sub_id, :bigint
  end
end
