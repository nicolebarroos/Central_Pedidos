class RenameFieldsInPedidos < ActiveRecord::Migration[6.0]
  def up
    rename_column :pedidos, :canal_compra, :purchase_channel
    rename_column :pedidos, :nome_cliente, :cliente_name
    rename_column :pedidos, :endereco, :address
    rename_column :pedidos, :valor_total, :total_value
    rename_column :pedidos, :servico_entrega, :delivery_service
    rename_column :pedidos, :itens, :line_items  
  end
end
