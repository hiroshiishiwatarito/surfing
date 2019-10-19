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

ActiveRecord::Schema.define(version: 20191016144832) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "chats", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guiders", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "",    null: false
    t.string   "encrypted_password",     limit: 255,   default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "nickname",               limit: 255
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 8
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
    t.text     "contact",                limit: 65535
    t.boolean  "accepted",                             default: false, null: false
    t.string   "lastname",               limit: 255
    t.string   "gender",                 limit: 255
    t.string   "birth",                  limit: 255
    t.string   "occupation",             limit: 255
    t.string   "faculty",                limit: 255
    t.integer  "test_id",                limit: 4
    t.integer  "profession_id",          limit: 4
    t.boolean  "approved"
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.text     "photo",                  limit: 65535
    t.text     "driver",                 limit: 65535
  end

  add_index "guiders", ["email"], name: "index_guiders_on_email", unique: true, using: :btree
  add_index "guiders", ["reset_password_token"], name: "index_guiders_on_reset_password_token", unique: true, using: :btree

  create_table "kakomons", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "plan_id",    limit: 4
    t.integer  "tourist_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "from_id",    limit: 4
    t.integer  "to_id",      limit: 4
    t.string   "room_id",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "price",        limit: 255
    t.string   "transport",    limit: 255
    t.string   "copy_image",   limit: 255
    t.string   "third_image",  limit: 255
    t.string   "fourth_image", limit: 255
    t.string   "five_image",   limit: 255
    t.integer  "test_id",      limit: 4
    t.string   "test_image",   limit: 255
    t.text     "description",  limit: 65535
    t.text     "body",         limit: 65535
    t.string   "big_title",    limit: 255
    t.integer  "category",     limit: 4
    t.integer  "tourist_id",   limit: 4
    t.integer  "likes_count",  limit: 4
    t.text     "others",       limit: 65535
    t.string   "university",   limit: 255
  end

  create_table "professions", force: :cascade do |t|
    t.string   "university",     limit: 255
    t.string   "faculty",        limit: 255
    t.string   "lesson",         limit: 255
    t.string   "teacher",        limit: 255
    t.string   "book",           limit: 255
    t.string   "thing",          limit: 255
    t.string   "year",           limit: 255
    t.string   "confirm",        limit: 255
    t.string   "recommendation", limit: 255
    t.text     "test",           limit: 65535
    t.text     "feel",           limit: 65535
    t.text     "content",        limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "guider_id",      limit: 4
    t.float    "rate",           limit: 24
    t.integer  "star",           limit: 4
    t.integer  "fun",            limit: 4
    t.string   "season",         limit: 255
    t.string   "type",           limit: 255
    t.string   "detail",         limit: 255
    t.integer  "pick_up",        limit: 4
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

  create_table "tests", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "body",        limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "description", limit: 65535
    t.string   "image",       limit: 255
    t.integer  "guider_id",   limit: 4
    t.integer  "plan_id",     limit: 4
    t.string   "secondword",  limit: 255
    t.string   "thirdword",   limit: 255
    t.text     "purpose",     limit: 65535
    t.string   "book",        limit: 255
    t.string   "summary",     limit: 255
    t.string   "author",      limit: 255
    t.string   "bookname",    limit: 255
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
    t.integer  "plan_id",                limit: 4
  end

  add_index "tourists", ["email"], name: "index_tourists_on_email", unique: true, using: :btree
  add_index "tourists", ["reset_password_token"], name: "index_tourists_on_reset_password_token", unique: true, using: :btree

end
