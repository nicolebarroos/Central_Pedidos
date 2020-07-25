class CreatePedidos < ActiveRecord::Migration[6.0]
  def change
    create_table :pedidos do |t|
      t.string :ref
      t.string :canal_compra
      t.string :nome_cliente
      t.string :endereco
      t.float :valor_total
      t.string :itens
      t.string :status
      t.references :lote, null: false, foreign_key: true

      t.timestamps
    end
  end
end
