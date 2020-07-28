class ChangeLoteToBatch < ActiveRecord::Migration[6.0]
  def change
    rename_table :lotes, :batch
  end
end
