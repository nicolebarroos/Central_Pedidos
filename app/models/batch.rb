class Batch < ApplicationRecord
    has_many :order
    validates :ref, :purchase_channel, :status, :delivery_service, presence: true

    #Filter certain batch status
    scope :by_status_batches, -> status { where(status: status) }
end
