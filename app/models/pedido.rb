class Pedido < ApplicationRecord
  #Associação
  belongs_to :lote
  #Validações
  validates :ref, :canal_compra, :nome_cliente, :endereco, :servico_entrega,
  :valor_total, :itens, :status, :lote_id, presence: true

  #Filtrar um canal de compra específico
  scope :by_canal, -> canal_compra { where(canal_compra: canal_compra) }

  #Filtrar um status específico
  #Algo interessante a ser implementado futuramente:
  #Passar um campo email_cliente em pedidos, sempre que um status for mudado, um email
  #é enviado, notificando o cliente do status do seu pedido.
  scope :by_status, -> status { where(status: status) }

  #É uma boa prática declarar métodos de retorno de chamada como particulares

end
