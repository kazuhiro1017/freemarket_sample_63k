class RemoveDeliveryMethodIdFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :delivery_method_id, :bigint
  end
end
