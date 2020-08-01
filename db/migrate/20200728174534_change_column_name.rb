class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :order, :lote_id, :batch_id
  end
end