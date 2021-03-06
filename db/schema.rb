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

ActiveRecord::Schema.define(version: 20161120170451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string  "title"
    t.integer "owner_id"
  end

  create_table "cards", force: :cascade do |t|
    t.text     "body"
    t.integer  "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cards", ["list_id"], name: "index_cards_on_list_id", using: :btree

  create_table "invitations", force: :cascade do |t|
    t.string   "email"
    t.integer  "board_id"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lists", force: :cascade do |t|
    t.string  "title"
    t.integer "user_id"
    t.integer "board_id"
  end

  add_index "lists", ["board_id"], name: "index_lists_on_board_id", using: :btree
  add_index "lists", ["user_id"], name: "index_lists_on_user_id", using: :btree

  create_table "memberships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "board_id"
  end

  add_index "memberships", ["board_id"], name: "index_memberships_on_board_id", using: :btree
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.text    "body"
    t.integer "list_id"
    t.integer "user_id"
  end

  add_index "tasks", ["list_id"], name: "index_tasks_on_list_id", using: :btree
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "lists", "boards"
  add_foreign_key "lists", "users"
  add_foreign_key "memberships", "boards"
  add_foreign_key "memberships", "users"
  add_foreign_key "tasks", "lists"
  add_foreign_key "tasks", "users"
end
