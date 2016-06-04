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

ActiveRecord::Schema.define(version: 20160603233429) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "museum_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "favorites", ["museum_id"], name: "index_favorites_on_museum_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "museum_categories", force: :cascade do |t|
    t.integer  "museum_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "museum_categories", ["category_id"], name: "index_museum_categories_on_category_id", using: :btree
  add_index "museum_categories", ["museum_id"], name: "index_museum_categories_on_museum_id", using: :btree

  create_table "museums", force: :cascade do |t|
    t.string   "name",                   null: false
    t.string   "formatted_address"
    t.string   "formatted_phone_number"
    t.decimal  "lat"
    t.decimal  "lng"
    t.string   "opening_hours"
    t.string   "photos"
    t.string   "place_id"
    t.string   "rates"
    t.string   "is_free"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "museums", ["name"], name: "index_museums_on_name", unique: true, using: :btree

  create_table "specials", force: :cascade do |t|
    t.text     "description", null: false
    t.integer  "museum_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "specials", ["museum_id"], name: "index_specials_on_museum_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                                null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "favorites", "museums"
  add_foreign_key "favorites", "users"
  add_foreign_key "museum_categories", "categories"
  add_foreign_key "museum_categories", "museums"
end
