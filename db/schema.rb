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

ActiveRecord::Schema.define(version: 20170622053651) do

  create_table "categories", force: true do |t|
    t.text   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conversations", force: true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.text   "category"
    t.text   "subcategory"
    t.text   "listing_name"
    t.text     "summary"
    t.text     "address_street"
    t.text   "address_city"
    t.text   "address_state"
    t.text   "address_zip"
    t.decimal  "price"
    t.boolean  "active"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "deposit"
  end

  add_index "items", ["user_id"], name: "index_items_on_user_id"

# Could not dump table "messages" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "photos", force: true do |t|
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text   "image_file_name"
    t.text   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photos", ["item_id"], name: "index_photos_on_item_id"

  create_table "reservations", force: true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.float    "price"
    t.float    "total"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "status"
  end

  add_index "reservations", ["item_id"], name: "index_reservations_on_item_id"
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id"

  create_table "reviews", force: true do |t|
    t.text     "comment"
    t.integer  "star"
    t.integer  "item_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["item_id"], name: "index_reviews_on_item_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "subcategories", force: true do |t|
    t.text   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id"

  create_table "users", force: true do |t|
    t.text   "email",                  default: "",      null: false
    t.text   "encrypted_password",     default: "",      null: false
    t.text   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.text   "current_sign_in_ip"
    t.text   "last_sign_in_ip"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.text   "fullname"
    t.text   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.text   "provider"
    t.text   "uid"
    t.text   "image"
    t.text   "string"
    t.text   "phone_number"
    t.text     "description"
    t.text     "testUser",               default: "false"
    t.boolean  "tos_agreement"
  end

end
