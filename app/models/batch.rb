class Batch < ApplicationRecord
    validates :ref, :purchase_channel, :status, presence: true

    #Filter certain batch status
    scope :by_status_batches, -> status { where(status: status) }
end
