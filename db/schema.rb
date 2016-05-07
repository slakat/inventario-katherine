# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160506174606) do

  create_table "products", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "nature",     limit: 255
    t.integer  "cost",       limit: 4
    t.integer  "price",      limit: 4
    t.string   "state",      limit: 255
    t.integer  "quantity",   limit: 4
    t.string   "code",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string  "name",       limit: 255
    t.integer "product_id", limit: 4, foreign_key: {references: "products", name: "fk_categories_product_id", on_update: :restrict, on_delete: :restrict}, index: {name: "index_categories_on_product_id", using: :btree}
  end

  create_table "extra_products", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "nature",     limit: 255
    t.integer  "cost",       limit: 4
    t.integer  "price",      limit: 4
    t.string   "state",      limit: 255
    t.integer  "quantity",   limit: 4
    t.string   "code",       limit: 255
    t.integer  "product_id", limit: 4, foreign_key: {references: "products", name: "fk_extra_products_product_id", on_update: :restrict, on_delete: :restrict}, index: {name: "fk_extra_products_product_id", using: :btree}
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "total",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "extras", force: :cascade do |t|
    t.integer "price",            limit: 4
    t.integer "quantity",         limit: 4
    t.string  "nature",           limit: 255
    t.string  "name",             limit: 255
    t.integer "cost",             limit: 4
    t.integer "extra_product_id", limit: 4, foreign_key: {references: "extra_products", name: "fk_extras_extra_product_id", on_update: :restrict, on_delete: :restrict}, index: {name: "fk_extras_extra_product_id", using: :btree}
    t.integer "transaction_id",   limit: 4, foreign_key: {references: "transactions", name: "fk_extras_transaction_id", on_update: :restrict, on_delete: :restrict}, index: {name: "fk_extras_transaction_id", using: :btree}
  end

  create_table "formulas", force: :cascade do |t|
    t.integer "quantity",    limit: 4
    t.integer "category_id", limit: 4, foreign_key: {references: "categories", name: "fk_formulas_category_id", on_update: :restrict, on_delete: :restrict}, index: {name: "index_formulas_on_category_id", using: :btree}
  end

  create_table "services", force: :cascade do |t|
    t.string  "name",  limit: 255
    t.integer "price", limit: 4
    t.string  "state", limit: 255
  end

  create_table "transaction_products", force: :cascade do |t|
    t.integer "price",          limit: 4
    t.string  "name",           limit: 255
    t.integer "transaction_id", limit: 4, foreign_key: {references: "transactions", name: "fk_transaction_products_transaction_id", on_update: :restrict, on_delete: :restrict}, index: {name: "fk_transaction_products_transaction_id", using: :btree}
    t.integer "product_id",     limit: 4, foreign_key: {references: "products", name: "fk_transaction_products_product_id", on_update: :restrict, on_delete: :restrict}, index: {name: "fk_transaction_products_product_id", using: :btree}
    t.integer "quantity",       limit: 4
  end

  create_table "transaction_services", force: :cascade do |t|
    t.integer "price",          limit: 4
    t.string  "name",           limit: 255
    t.integer "transaction_id", limit: 4, foreign_key: {references: "transactions", name: "fk_transaction_services_transaction_id", on_update: :restrict, on_delete: :restrict}, index: {name: "fk_transaction_services_transaction_id", using: :btree}
    t.integer "service_id",     limit: 4, foreign_key: {references: "services", name: "fk_transaction_services_service_id", on_update: :restrict, on_delete: :restrict}, index: {name: "fk_transaction_services_service_id", using: :btree}
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false, index: {name: "index_users_on_email", unique: true, using: :btree}
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255, index: {name: "index_users_on_reset_password_token", unique: true, using: :btree}
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
