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

ActiveRecord::Schema.define(version: 20141120033122) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.text     "body"
    t.string   "commentable_type"
    t.integer  "receiver_id"
    t.integer  "parent_comment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nodes", force: true do |t|
    t.string   "title"
    t.text     "desc"
    t.integer  "topics_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: true do |t|
    t.integer  "user_id"
    t.integer  "node_id"
    t.string   "title"
    t.string   "permalink"
    t.text     "body"
    t.integer  "level"
    t.integer  "views"
    t.integer  "comments_count",  default: 0
    t.integer  "last_comment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "uuid",           default: ""
    t.string   "name",           default: ""
    t.string   "email",          default: ""
    t.string   "form"
    t.string   "avatar",         default: ""
    t.integer  "topics_count",   default: 0
    t.integer  "comments_count", default: 0
    t.datetime "confirmed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
