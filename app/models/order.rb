class Order < ApplicationRecord
  #Association
  belongs_to :batch
  #Validations
  validates :ref, :purchase_channel, :cliente_name, :address, :delivery_service, presence: true
  validates :total_value, :line_items, :status, :batch_id, presence: true
  validates_with PurchaseChannel

  #Filter a specific purchase channel
  scope :by_channel, -> purchase_channel { where(purchase_channel: purchase_channel) }

  scope :by_items, -> line_items { where(line_items: line_items) }

  #Filter a specific status
  scope :by_status, -> status { where(status: status) }

  

end
