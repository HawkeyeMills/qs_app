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

ActiveRecord::Schema.define(version: 20140820181516) do

  create_table "grade_configs", force: true do |t|
    t.integer  "metricconfig_id"
    t.decimal  "weight",          precision: 4, scale: 2
    t.decimal  "percentoftotal",  precision: 8, scale: 3
    t.string   "goal"
    t.string   "calcToUse"
    t.string   "type"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metric_configs", force: true do |t|
    t.integer  "user_id"
    t.string   "metricname"
    t.string   "fbvalue"
    t.integer  "orderby"
    t.boolean  "profiledisplay"
    t.boolean  "updateable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metrics", force: true do |t|
    t.integer  "metric_config_id"
    t.datetime "metricdate"
    t.decimal  "value",            precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
