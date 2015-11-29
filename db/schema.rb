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

ActiveRecord::Schema.define(version: 20151129040357) do

# Could not dump table "areas" because of following StandardError
#   Unknown type 'geometry' for column 'latlong'

  create_table "collections", force: :cascade do |t|
    t.integer  "user_id",          limit: 4,                 null: false
    t.string   "title",            limit: 500
    t.date     "start_date"
    t.date     "end_date"
    t.text     "cover_image_file", limit: 65535
    t.text     "content",          limit: 65535
    t.integer  "status",           limit: 1,     default: 0, null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "collections", ["user_id"], name: "user_id", using: :btree

  create_table "escape_areas", force: :cascade do |t|
    t.integer  "escape_id",  limit: 4, null: false
    t.integer  "area_id",    limit: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "escape_areas", ["area_id"], name: "theme_id", using: :btree

  create_table "escape_themes", force: :cascade do |t|
    t.integer  "theme_id",   limit: 4, null: false
    t.integer  "escape_id",  limit: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "escapes" because of following StandardError
#   Unknown type 'geometry' for column 'latlong'

  create_table "favorite_user_escape", force: :cascade do |t|
    t.integer "user_id",       limit: 4
    t.integer "escape_id",     limit: 4
    t.integer "collection_id", limit: 4
  end

  create_table "follow", force: :cascade do |t|
    t.integer  "user_id",        limit: 4, null: false
    t.integer  "target_user_id", limit: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follow", ["target_user_id"], name: "target_user_id", using: :btree
  add_index "follow", ["user_id"], name: "user_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.integer  "user_id",           limit: 4,                    null: false
    t.integer  "escape_id",         limit: 4,                    null: false
    t.text     "image_file",        limit: 65535,                null: false
    t.datetime "image_updated_at"
    t.boolean  "use_in_collection", limit: 1,     default: true
    t.integer  "use_as_escape_top", limit: 1,     default: 0,    null: false
    t.integer  "order_in_escape",   limit: 4
    t.text     "caption",           limit: 65535
    t.datetime "created_at"
    t.datetime "modified_at"
  end

  create_table "people", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "age",        limit: 4
    t.text     "memo",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "body",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "price",      limit: 4
    t.text     "memo",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shops", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "zipcode",    limit: 255
    t.string   "address",    limit: 255
    t.string   "tel",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "themes", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "order_priority", limit: 4,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",           limit: 255,                 null: false
    t.string   "email",              limit: 500
    t.string   "password",           limit: 255,   default: "0", null: false
    t.string   "name",               limit: 255,                 null: false
    t.text     "thumb_image_file",   limit: 65535,               null: false
    t.text     "profile_image_file", limit: 65535
    t.string   "facebook_id",        limit: 500
    t.string   "instagram_id",       limit: 500
    t.string   "job",                limit: 255
    t.string   "position",           limit: 255
    t.string   "url",                limit: 255
    t.string   "area",               limit: 255
    t.text     "biography",          limit: 65535
    t.integer  "is_muse",            limit: 1,     default: 0,   null: false
    t.string   "passport_hash",      limit: 500
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "img_count",          limit: 4
  end

  add_index "users", ["facebook_id"], name: "facebook_id", length: {"facebook_id"=>255}, using: :btree
  add_index "users", ["instagram_id"], name: "instagram_id", length: {"instagram_id"=>255}, using: :btree

end
