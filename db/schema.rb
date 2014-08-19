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

ActiveRecord::Schema.define(version: 20140814053926) do

  create_table "metricconfigs", force: true do |t|
    t.string   "value"
    t.integer  "user_id"
    t.integer  "orderby"
    t.boolean  "profiledisplay"
    t.boolean  "updatable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "metricconfigs", ["user_id"], name: "index_metricconfigs_on_user_id", using: :btree

  create_table "metrics", force: true do |t|
    t.integer  "metricconfig_id"
    t.date     "date"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "metrics", ["metricconfig_id", "date"], name: "index_metrics_on_metricconfig_id_and_date", using: :btree

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
