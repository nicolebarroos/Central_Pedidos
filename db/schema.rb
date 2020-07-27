# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_27_011420) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lotes", force: :cascade do |t|
    t.string "ref"
    t.string "canal_compra"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pedidos", force: :cascade do |t|
    t.string "ref"
    t.string "canal_compra"
    t.string "nome_cliente"
    t.string "endereco"
    t.float "valor_total"
    t.string "itens"
    t.string "status"
    t.bigint "lote_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "servico_entrega"
    t.index ["lote_id"], name: "index_pedidos_on_lote_id"
  end

  add_foreign_key "pedidos", "lotes"
end
