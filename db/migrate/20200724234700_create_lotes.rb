class CreateLotes < ActiveRecord::Migration[6.0]
  def change
    create_table :lotes do |t|
      t.string :ref
      t.string :canal_compra

      t.timestamps
    end
  end
end
