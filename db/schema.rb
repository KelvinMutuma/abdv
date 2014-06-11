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

ActiveRecord::Schema.define(version: 20140611113803) do

  create_table "banks", force: true do |t|
    t.integer  "volume"
    t.float    "high"
    t.float    "low"
    t.float    "war"
    t.integer  "window_borrowing"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid"
    t.datetime "published_at"
  end

  create_table "changers", force: true do |t|
    t.string   "security"
    t.float    "price"
    t.float    "percentage_change"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid"
    t.datetime "published_at"
  end

  create_table "forexes", force: true do |t|
    t.string   "currency"
    t.float    "buy"
    t.float    "sell"
    t.float    "mean"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid"
    t.datetime "published_at"
  end

  create_table "markets", force: true do |t|
    t.float    "equity_turnover"
    t.float    "market_capitalization"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid"
    t.datetime "published_at"
  end

  create_table "movers", force: true do |t|
    t.string   "mover"
    t.integer  "volume"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid"
    t.datetime "published_at"
  end

  create_table "securities", force: true do |t|
    t.string   "security"
    t.string   "security_code"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "securities", ["category", "security_code"], name: "index_securities_on_category_and_security_code"
  add_index "securities", ["security"], name: "index_securities_on_security", unique: true

  create_table "share_indices", force: true do |t|
    t.float    "all_share_index"
    t.float    "twenty_share_index"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid"
    t.datetime "published_at"
  end

  create_table "stock_quotes", force: true do |t|
    t.integer  "security_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "yesterday",         default: 0.0
    t.float    "current",           default: 0.0
    t.float    "price_change",      default: 0.0
    t.float    "percentage_change", default: 0.0
    t.float    "high",              default: 0.0
    t.float    "low",               default: 0.0
    t.string   "guid"
    t.datetime "published_at"
  end

  add_index "stock_quotes", ["security_id"], name: "index_stock_quotes_on_security_id"

end
