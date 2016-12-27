# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161227142019) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.boolean  "credit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal  "overdraft"
  end

  create_table "ar_internal_metadata", primary_key: "key", id: :string, force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string   "description"
    t.date     "processed_on"
    t.integer  "account_id"
    t.decimal  "amount"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["account_id"], name: "index_transactions_on_account_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

  add_foreign_key "transactions", "accounts"

  create_view :transaction_summaries,  sql_definition: <<-SQL
      SELECT t.id,
      t.description,
      t.processed_on,
      t.account_id,
      t.amount,
      t.created_at,
      t.updated_at,
      t.balance,
      (a.overdraft + t.balance) AS available
     FROM (( SELECT transactions.id,
              transactions.description,
              transactions.processed_on,
              transactions.account_id,
              transactions.amount,
              transactions.created_at,
              transactions.updated_at,
              sum(transactions.amount) OVER (PARTITION BY transactions.account_id ORDER BY transactions.processed_on ROWS UNBOUNDED PRECEDING) AS balance
             FROM transactions) t
       JOIN accounts a ON ((a.id = t.account_id)));
  SQL

end
