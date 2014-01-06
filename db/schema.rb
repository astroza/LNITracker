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

ActiveRecord::Schema.define(version: 20131226212355) do

  create_table "bus_stops", force: true do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "command_responses", force: true do |t|
    t.string   "response"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: true do |t|
    t.string   "name"
    t.string   "identifier"
    t.string   "vehicle_plate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "connections",   default: 0
  end

  create_table "pending_commands", force: true do |t|
    t.string   "command"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "sent",       default: false
  end

  create_table "trackpoints", force: true do |t|
    t.integer  "device_id", null: false
    t.float    "latitude",  null: false
    t.float    "longitude", null: false
    t.float    "elevation"
    t.datetime "time",      null: false
    t.float    "velocity"
  end

end
