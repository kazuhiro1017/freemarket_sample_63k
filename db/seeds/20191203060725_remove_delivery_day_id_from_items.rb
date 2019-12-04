class RemoveDeliveryDayIdFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :delivery_day_id, :bigint
  end
end
