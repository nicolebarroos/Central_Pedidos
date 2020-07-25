class Lote < ApplicationRecord
    validates :ref, :canal_compra, presence: true
end
