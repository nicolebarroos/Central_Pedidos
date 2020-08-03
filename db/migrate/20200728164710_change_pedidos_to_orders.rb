class ChangePedidosToOrders < ActiveRecord::Migration[6.0]
  def change
    rename_table :pedidos, :order
  end
end
