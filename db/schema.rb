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

ActiveRecord::Schema.define(version: 20181029135021) do

  create_table "chats", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "null",       limit: 255
    t.integer  "service_id", limit: 4
    t.string   "false",      limit: 255
    t.string   "index",      limit: 255
    t.string   "true",       limit: 255
    t.integer  "cny",        limit: 4
  end

  create_table "communities", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.integer  "admin_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "community_guiders", force: :cascade do |t|
    t.integer  "tourist_id",   limit: 4
    t.integer  "guider_id",    limit: 4
    t.integer  "community_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "community_guiders", ["community_id"], name: "index_community_guiders_on_community_id", using: :btree
  add_index "community_guiders", ["guider_id"], name: "index_community_guiders_on_guider_id", using: :btree
  add_index "community_guiders", ["tourist_id"], name: "index_community_guiders_on_tourist_id", using: :btree

  create_table "friendships", force: :cascade do |t|
    t.integer  "tourist_id", limit: 4
    t.integer  "guider_id",  limit: 4
    t.integer  "friend_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["friend_id"], name: "index_friendships_on_friend_id", using: :btree
  add_index "friendships", ["guider_id"], name: "index_friendships_on_guider_id", using: :btree
  add_index "friendships", ["tourist_id"], name: "index_friendships_on_tourist_id", using: :btree

  create_table "guiders", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "nickname",               limit: 255
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
    t.string   "student_name",           limit: 255
    t.text     "Image",                  limit: 65535
    t.string   "year",                   limit: 255
    t.string   "hometown",               limit: 255
    t.text     "message",                limit: 65535
    t.string   "university",             limit: 255
    t.integer  "plan_id",                limit: 4
    t.integer  "tourist_id",             limit: 4
    t.integer  "chat_id",                limit: 4
    t.text     "gmail",                  limit: 65535
    t.text     "contact",                limit: 65535
  end

  add_index "guiders", ["email"], name: "index_guiders_on_email", unique: true, using: :btree
  add_index "guiders", ["reset_password_token"], name: "index_guiders_on_reset_password_token", unique: true, using: :btree

  create_table "letters", force: :cascade do |t|
    t.text     "body",         limit: 65535
    t.integer  "tourist_id",   limit: 4
    t.integer  "guider_id",    limit: 4
    t.integer  "community_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "letters", ["guider_id"], name: "index_letters_on_guider_id", using: :btree
  add_index "letters", ["tourist_id"], name: "index_letters_on_tourist_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "from_id",    limit: 4
    t.integer  "to_id",      limit: 4
    t.string   "room_id",    limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "chat_id",    limit: 4
    t.integer  "tourist_id", limit: 4
    t.text     "contents",   limit: 65535
  end

  add_index "messages", ["room_id", "created_at"], name: "index_messages_on_room_id_and_created_at", using: :btree

  create_table "plans", force: :cascade do |t|
    t.text     "title",        limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "guider_id",    limit: 4
    t.text     "contents",     limit: 65535
    t.integer  "times",        limit: 4
    t.text     "datetimes",    limit: 65535
    t.string   "image",        limit: 255
    t.string   "place",        limit: 255
    t.string   "meetingplace", limit: 255
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "student_name", limit: 255
    t.string   "school",       limit: 255
    t.string   "year",         limit: 255
    t.string   "hometown",     limit: 255
    t.text     "image",        limit: 65535
    t.text     "message",      limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "texts", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "body",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "tourists", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
  end

  add_index "tourists", ["email"], name: "index_tourists_on_email", unique: true, using: :btree
  add_index "tourists", ["reset_password_token"], name: "index_tourists_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "community_guiders", "communities"
  add_foreign_key "community_guiders", "guiders"
  add_foreign_key "community_guiders", "tourists"
  add_foreign_key "letters", "guiders"
  add_foreign_key "letters", "tourists"
end
