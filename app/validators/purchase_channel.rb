class PurchaseChannel < ActiveModel::Validator

    ERROR_MESSAGE = "O pedido deve ter o mesmo canal de compra que o lote"

    def validate(record)
        batchPurchaseChannel = Batch.find(record.batch_id)

        record.errors[:base] << ERROR_MESSAGE if batchPurchaseChannel.nil?
        if record.purchase_channel != batchPurchaseChannel.purchase_channel
            record.errors[:base] << ERROR_MESSAGE
        end
    end
    
end