class RenameFieldsInLotes < ActiveRecord::Migration[6.0]
  def up
    rename_column :lotes, :canal_compra, :purchase_channel
  end
end
