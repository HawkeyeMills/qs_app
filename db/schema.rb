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

ActiveRecord::Schema.define(version: 20141024033117) do

  create_table "daily_grades", force: true do |t|
    t.integer  "grade_id"
    t.integer  "points"
    t.integer  "possible"
    t.date     "gradeDate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dailymetricsflat_tmp", primary_key: "dailyMetricsID", force: true do |t|
    t.date     "metricDate",                                                         null: false
    t.integer  "steps"
    t.integer  "distance"
    t.integer  "activityCalories"
    t.integer  "caloriesBMR"
    t.integer  "calories"
    t.integer  "caloriesIn"
    t.integer  "minutesSendentary"
    t.integer  "minutesLightlyActive"
    t.integer  "minutesFailryActive"
    t.integer  "minutesVeryActive"
    t.integer  "timeInBed"
    t.integer  "minutesAsleep"
    t.integer  "minutesAwake"
    t.integer  "awakeningsCount"
    t.integer  "efficiency"
    t.decimal  "minutesToFallAsleep",                        precision: 8, scale: 2
    t.decimal  "minutesAfterWakeup",                         precision: 8, scale: 2
    t.decimal  "weight",                                     precision: 8, scale: 2
    t.decimal  "bmi",                                        precision: 8, scale: 2
    t.decimal  "fat",                                        precision: 8, scale: 2
    t.integer  "water"
    t.integer  "carbs"
    t.integer  "protein"
    t.integer  "fiber"
    t.integer  "sodium"
    t.integer  "systolic"
    t.integer  "diastolic"
    t.integer  "rhr"
    t.time     "duration"
    t.decimal  "workoutRate",                                precision: 8, scale: 2
    t.integer  "pushups"
    t.text     "notes",                   limit: 2147483647
    t.binary   "dbtcAlcohol",             limit: 1
    t.binary   "dbtcMotivation",          limit: 1
    t.binary   "dbtcPicture",             limit: 1
    t.binary   "dbtcWorkout",             limit: 1
    t.binary   "dbtcJavahouse",           limit: 1
    t.binary   "dbtcCaloriesAfterDinner", limit: 1
    t.binary   "dbtcReserved0",           limit: 1
    t.binary   "dbtcReserved1",           limit: 1
    t.binary   "dbtcReserved2",           limit: 1
    t.binary   "dbtcReserved3",           limit: 1
    t.datetime "createDate"
    t.datetime "lastUpdateDate"
  end

  add_index "dailymetricsflat_tmp", ["dailyMetricsID"], name: "dailyMetricsID_UNIQUE", unique: true, using: :btree
  add_index "dailymetricsflat_tmp", ["metricDate"], name: "metricDate_UNIQUE", unique: true, using: :btree

  create_table "grade_calcs", force: true do |t|
    t.string   "gradecalc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grade_configs", force: true do |t|
    t.integer  "metric_config_id"
    t.integer  "grade_calc_id"
    t.decimal  "weight",           precision: 4, scale: 2
    t.decimal  "percentoftotal",   precision: 8, scale: 3
    t.string   "goal"
    t.string   "type"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grades", force: true do |t|
    t.string   "gradevalue"
    t.integer  "minrange"
    t.integer  "maxrange"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metric_configs", force: true do |t|
    t.integer  "user_id"
    t.string   "metricname"
    t.string   "fbvalue"
    t.string   "label",          limit: 45
    t.string   "metrictype"
    t.integer  "orderby"
    t.boolean  "profiledisplay"
    t.boolean  "updateable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metric_grades", force: true do |t|
    t.integer  "metric_id"
    t.integer  "grade_id"
    t.integer  "points"
    t.integer  "percentage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metrics", force: true do |t|
    t.integer  "metric_config_id"
    t.date     "metricdate"
    t.decimal  "value",            precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", force: true do |t|
    t.text     "note"
    t.integer  "user_id"
    t.datetime "notedate"
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
