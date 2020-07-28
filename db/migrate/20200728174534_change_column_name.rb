class ChangeColumnName < ActiveRecord::Migration[6.0]
  def up
    rename_column :order, :lote_id, :batch_id
  end
end