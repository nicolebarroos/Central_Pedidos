class AddDeliveryServiceToBatches < ActiveRecord::Migration[6.0]
  def change
    add_column :batches, :delivery_service, :string
  end
end
