class DeliveryService < ActiveModel::Validator

    ERROR_MESSAGE = "O pedido deve ter o mesmo serviço de entrega que o lote"

    def validate(record)
        batchDeliveryService = Batch.find(record.batch_id)

        record.errors[:base] << ERROR_MESSAGE if batchDeliveryService.nil?
        if record.delivery_service != batchDeliveryService.delivery_service
            record.errors[:base] << ERROR_MESSAGE
        end
    end
    
end