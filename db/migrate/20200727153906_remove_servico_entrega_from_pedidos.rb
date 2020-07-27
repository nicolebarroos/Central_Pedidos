class RemoveServicoEntregaFromPedidos < ActiveRecord::Migration[6.0]
  def change
    remove_column :pedidos, :servico_entrega, :string
  end
end
