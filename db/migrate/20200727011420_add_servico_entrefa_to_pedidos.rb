class AddServicoEntrefaToPedidos < ActiveRecord::Migration[6.0]
    def change
      add_column :pedidos, :servico_entrega, :string
    end
  end