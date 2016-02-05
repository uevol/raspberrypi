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

ActiveRecord::Schema.define(version: 20160126064428) do

  create_table "curtemphumis", force: true do |t|
    t.string   "location"
    t.decimal  "temp"
    t.decimal  "humi"
    t.string   "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "date"
    t.decimal  "maxtemp"
    t.decimal  "mintemp"
    t.decimal  "maxhumi"
    t.decimal  "minhumi"
    t.integer  "hour"
  end

  create_table "curths", force: true do |t|
    t.string   "location"
    t.string   "date"
    t.string   "time"
    t.decimal  "temp"
    t.decimal  "humi"
    t.integer  "hour"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
