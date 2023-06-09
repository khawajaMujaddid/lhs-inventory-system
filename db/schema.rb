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

ActiveRecord::Schema[7.0].define(version: 2023_05_21_120944) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "main_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.integer "quantity", null: false
    t.decimal "price", precision: 10, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "main_category_id", null: false
    t.bigint "sub_category_id", null: false
    t.index ["main_category_id"], name: "index_products_on_main_category_id"
    t.index ["sub_category_id"], name: "index_products_on_sub_category_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "quantity", null: false
    t.decimal "price", precision: 10, scale: 2, null: false
    t.date "date_purchased", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id", null: false
    t.index ["product_id"], name: "index_purchases_on_product_id"
  end

  create_table "sales", force: :cascade do |t|
    t.string "customer_name"
    t.string "customer_email"
    t.decimal "sale_price", precision: 10, scale: 2, null: false
    t.text "customer_address"
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sales_on_product_id"
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string "name"
    t.bigint "main_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["main_category_id"], name: "index_sub_categories_on_main_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "products", "main_categories"
  add_foreign_key "products", "sub_categories"
  add_foreign_key "purchases", "products"
  add_foreign_key "sales", "products"
  add_foreign_key "sub_categories", "main_categories"
end
