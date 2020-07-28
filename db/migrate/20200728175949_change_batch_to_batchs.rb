class ChangeBatchToBatchs < ActiveRecord::Migration[6.0]
  def change
    rename_table :batch, :batchs
  end
end
