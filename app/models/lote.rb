class Lote < ApplicationRecord
    validates :ref, :canal_compra, :status, presence: true

    #Filtrar determinado status dos lotes
    scope :by_status_lotes, -> status { where(status: status) }
end
