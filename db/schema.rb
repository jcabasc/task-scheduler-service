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

ActiveRecord::Schema.define(version: 20160221223248) do

  create_table "servers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "servers_tasks", force: :cascade do |t|
    t.integer "server_id", limit: 4
    t.integer "task_id",   limit: 4
  end

  add_index "servers_tasks", ["server_id"], name: "index_servers_tasks_on_server_id", using: :btree
  add_index "servers_tasks", ["task_id"], name: "index_servers_tasks_on_task_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "executable_path", limit: 255
    t.datetime "started_at"
    t.datetime "ended_at"
    t.text     "days_of_week",    limit: 65535
    t.string   "status",          limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                limit: 255, default: "", null: false
    t.string   "encrypted_password",   limit: 255, default: "", null: false
    t.string   "authentication_token", limit: 255
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "servers_tasks", "servers"
  add_foreign_key "servers_tasks", "tasks"
end
