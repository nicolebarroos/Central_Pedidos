class RenameFieldsInLotes < ActiveRecord::Migration[6.0]
  def change
    rename_column :lotes, :canal_compra, :purchase_channel
  end
end
