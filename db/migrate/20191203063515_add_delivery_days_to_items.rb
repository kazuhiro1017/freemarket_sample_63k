class AddDeliveryDaysToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :delivery_days, :integer
  end
end
