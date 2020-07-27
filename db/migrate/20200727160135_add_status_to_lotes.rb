class AddStatusToLotes < ActiveRecord::Migration[6.0]
  def change
    add_column :lotes, :status, :string
  end
end
