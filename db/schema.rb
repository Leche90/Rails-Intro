# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_10_23_125841) do

  create_table "cryptocurrencies", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.decimal "price"
    t.bigint "market_cap"
    t.bigint "volume"
    t.float "change"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cryptocurrencies_exchanges", id: false, force: :cascade do |t|
    t.integer "cryptocurrency_id", null: false
    t.integer "exchange_id", null: false
  end

  create_table "cryptocurrencies_users", id: false, force: :cascade do |t|
    t.integer "cryptocurrency_id", null: false
    t.integer "user_id", null: false
    t.index ["cryptocurrency_id"], name: "index_cryptocurrencies_users_on_cryptocurrency_id"
    t.index ["user_id"], name: "index_cryptocurrencies_users_on_user_id"
  end

  create_table "exchanges", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "cryptocurrency_id", null: false
    t.decimal "amount"
    t.string "transaction_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cryptocurrency_id"], name: "index_transactions_on_cryptocurrency_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "transactions", "cryptocurrencies"
  add_foreign_key "transactions", "users"
end
