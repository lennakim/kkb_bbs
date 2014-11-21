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

ActiveRecord::Schema.define(version: 20141121114717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "body"
    t.integer  "receiver_id"
    t.integer  "parent_comment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
  add_index "comments", ["id"], name: "index_comments_on_id", unique: true, using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "nodes", force: true do |t|
    t.string   "title"
    t.text     "desc"
    t.integer  "topics_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nodes", ["id"], name: "index_nodes_on_id", unique: true, using: :btree

  create_table "notifications", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.integer  "subjectable_id"
    t.string   "subjectable_type"
    t.boolean  "read",             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["id"], name: "index_notifications_on_id", unique: true, using: :btree
  add_index "notifications", ["subjectable_id", "subjectable_type"], name: "index_notifications_on_subjectable_id_and_subjectable_type", using: :btree
  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id", using: :btree

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

  add_index "topics", ["id"], name: "index_topics_on_id", unique: true, using: :btree
  add_index "topics", ["node_id"], name: "index_topics_on_node_id", using: :btree
  add_index "topics", ["user_id"], name: "index_topics_on_user_id", using: :btree

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
