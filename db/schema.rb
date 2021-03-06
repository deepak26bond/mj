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

ActiveRecord::Schema.define(version: 20141118142754) do

  create_table "category_details", force: true do |t|
    t.string   "category"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_details", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "weight",             limit: 255
    t.integer  "price_detail_id"
    t.integer  "category_detail_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "category"
    t.string   "subcategory"
    t.text     "product_deatil"
    t.text     "style_note"
  end

  create_table "price_details", force: true do |t|
    t.string   "name"
    t.integer  "price",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
