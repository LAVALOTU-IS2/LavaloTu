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

ActiveRecord::Schema.define(version: 20161123062345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.string   "description"
    t.string   "benefit"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_achievements_on_user_id", using: :btree
  end

  create_table "deliverers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.integer  "laundry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["laundry_id"], name: "index_deliverers_on_laundry_id", using: :btree
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer  "direction"
    t.datetime "deliver_date"
    t.integer  "order_id",     null: false
    t.integer  "deliverer_id"
    t.integer  "place_id",     null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["deliverer_id"], name: "index_deliveries_on_deliverer_id", using: :btree
    t.index ["order_id"], name: "index_deliveries_on_order_id", using: :btree
    t.index ["place_id"], name: "index_deliveries_on_place_id", using: :btree
  end

  create_table "garments", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_identities_on_user_id", using: :btree
  end

  create_table "laundries", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "opening_time"
    t.string   "closing_time"
    t.float    "score"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.string   "description"
    t.integer  "quantity"
    t.float    "cost"
    t.float    "unit_cost"
    t.string   "service_name"
    t.integer  "order_id"
    t.integer  "garment_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["garment_id"], name: "index_order_details_on_garment_id", using: :btree
    t.index ["order_id"], name: "index_order_details_on_order_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "pickup_date"
    t.datetime "deviler_date"
    t.float    "total_cost"
    t.string   "status"
    t.integer  "score"
    t.datetime "date_finished"
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "laundry_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["laundry_id"], name: "index_orders_on_laundry_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "latitude"
    t.float    "longitude"
    t.index ["user_id"], name: "index_places_on_user_id", using: :btree
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.float    "cost"
    t.integer  "garment_id"
    t.integer  "laundry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garment_id"], name: "index_services_on_garment_id", using: :btree
    t.index ["laundry_id"], name: "index_services_on_laundry_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "lastname"
    t.string   "phone"
    t.string   "provider"
    t.string   "uid"
    t.string   "acces_token"
    t.datetime "oauth_expires_at"
    t.string   "image"
    t.string   "auth_token"
    t.integer  "role",                   default: 0
    t.integer  "orders"
    t.integer  "laundry_id"
    t.integer  "deliverer_id"
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["deliverer_id"], name: "index_users_on_deliverer_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["laundry_id"], name: "index_users_on_laundry_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "achievements", "users"
  add_foreign_key "deliverers", "laundries"
  add_foreign_key "deliveries", "deliverers"
  add_foreign_key "deliveries", "orders"
  add_foreign_key "deliveries", "places"
  add_foreign_key "identities", "users"
  add_foreign_key "order_details", "garments"
  add_foreign_key "order_details", "orders"
  add_foreign_key "orders", "laundries"
  add_foreign_key "orders", "users"
  add_foreign_key "places", "users"
  add_foreign_key "services", "garments"
  add_foreign_key "services", "laundries"
  add_foreign_key "users", "deliverers"
  add_foreign_key "users", "laundries"
end
