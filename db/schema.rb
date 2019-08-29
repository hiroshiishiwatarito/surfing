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

ActiveRecord::Schema.define(version: 20190827083049) do

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
  end

  add_index "guiders", ["email"], name: "index_guiders_on_email", unique: true, using: :btree
  add_index "guiders", ["reset_password_token"], name: "index_guiders_on_reset_password_token", unique: true, using: :btree

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
    t.string   "string",       limit: 255
    t.string   "second_image", limit: 255
    t.string   "third_image",  limit: 255
    t.string   "fourth_image", limit: 255
    t.string   "five_image",   limit: 255
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

end
