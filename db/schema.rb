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

ActiveRecord::Schema.define(version: 2019_06_22_212127) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dish_availabilities", force: :cascade do |t|
    t.date "date"
    t.string "portion_available"
    t.string "address"
    t.bigint "dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.index ["dish_id"], name: "index_dish_availabilities_on_dish_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.string "title"
    t.string "ingredients"
    t.string "photo"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "allergens"
    t.text "cuisine", default: [], array: true
    t.integer "price_cents", default: 0, null: false
    t.index ["user_id"], name: "index_dishes_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "qr_code"
    t.string "dishes_portion"
    t.bigint "dish_availability_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "comment"
    t.string "status"
    t.jsonb "payment"
    t.integer "amount_cents", default: 0, null: false
    t.index ["dish_availability_id"], name: "index_orders_on_dish_availability_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "stars"
    t.string "comment"
    t.bigint "user_id"
    t.bigint "dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_reviews_on_dish_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "address"
    t.string "phone_number"
    t.string "category"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.text "bio"
    t.boolean "is_chef"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "dish_availabilities", "dishes"
  add_foreign_key "dishes", "users"
  add_foreign_key "orders", "dish_availabilities"
  add_foreign_key "orders", "users"
  add_foreign_key "reviews", "dishes"
  add_foreign_key "reviews", "users"
end
