class AddDeliveryMethodToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :delivery_method, :integer
  end
end
