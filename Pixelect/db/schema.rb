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

ActiveRecord::Schema.define(version: 20150312145902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "body"
    t.integer  "tournament_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["tournament_id"], name: "index_comments_on_tournament_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.integer  "tournament_id"
    t.string   "url"
    t.integer  "wins"
    t.integer  "flags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["tournament_id"], name: "index_images_on_tournament_id", using: :btree

  create_table "tournaments", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "question"
    t.string   "email_list"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tournaments", ["user_id"], name: "index_tournaments_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "token"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "comments", "tournaments"
  add_foreign_key "comments", "users"
  add_foreign_key "images", "tournaments"
  add_foreign_key "tournaments", "users"
end
