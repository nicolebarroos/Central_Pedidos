class Pedido < ApplicationRecord
  #Associação
  belongs_to :lote
  #Validações
  validates :ref, :canal_compra, :nome_cliente, :endereco,
  :valor_total, :itens, :status, :lote_id, presence: true

  #Filtrar um canal de compra específico
  scope :by_canal, -> canal_compra { where(canal_compra: canal_compra) }
end
