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

ActiveRecord::Schema.define(version: 20140327071509) do

  create_table "achievements", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedback_items", force: true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.integer  "grade"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedback_users", force: true do |t|
    t.integer  "grade"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks_received", id: false, force: true do |t|
    t.integer "user_received_id"
    t.integer "feedback_user_id"
  end

  create_table "feedbacks_sent", id: false, force: true do |t|
    t.integer "user_sent_id"
    t.integer "feedback_user_id"
  end

  create_table "items", force: true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "name"
    t.string   "picture"
    t.text     "description"
    t.decimal  "rentUnitPrice"
    t.time     "unitTime"
    t.time     "minimumRentingTime"
    t.time     "maximumRentingTime"
    t.decimal  "totalValue"
    t.boolean  "isAvailable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logs", force: true do |t|
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "nick"
    t.string   "email"
    t.string   "password"
    t.date     "birthday"
    t.string   "picture"
    t.boolean  "isTermConditionsChecked"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
