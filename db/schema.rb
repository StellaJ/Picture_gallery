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

ActiveRecord::Schema.define(version: 20140711200657) do

  create_table "articles", force: true do |t|
    t.integer  "page_id"
    t.string   "name"
    t.integer  "position"
    t.boolean  "visibility",         default: true
    t.text     "content"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.boolean  "visibility", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.integer  "category_id"
    t.string   "name"
    t.integer  "position"
    t.boolean  "visibility",  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["category_id"], name: "index_pages_on_category_id"

  create_table "users", force: true do |t|
    t.string   "first_name",      limit: 20
    t.string   "last_name",       limit: 60
    t.string   "user",            limit: 25
    t.string   "email",           limit: 100, default: "", null: false
    t.string   "telephon",                    default: "", null: false
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["user"], name: "index_users_on_user"

end
