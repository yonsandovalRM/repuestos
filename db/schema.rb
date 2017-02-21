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

ActiveRecord::Schema.define(version: 20170220191541) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.integer  "brand_id"
    t.integer  "type_article_id"
    t.integer  "type_vehicle_id"
    t.integer  "type_format_id"
    t.boolean  "status"
    t.string   "applicant"
    t.integer  "pin"
    t.integer  "pou"
    t.integer  "discount"
    t.integer  "stock"
    t.integer  "stock_store"
    t.integer  "stock_min"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["brand_id"], name: "index_articles_on_brand_id", using: :btree
    t.index ["type_article_id"], name: "index_articles_on_type_article_id", using: :btree
    t.index ["type_format_id"], name: "index_articles_on_type_format_id", using: :btree
    t.index ["type_vehicle_id"], name: "index_articles_on_type_vehicle_id", using: :btree
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "rut"
    t.string   "bname"
    t.string   "address"
    t.string   "comunne"
    t.string   "city"
    t.string   "activity"
    t.string   "phone"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_articles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_formats", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_vehicles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "articles", "brands"
  add_foreign_key "articles", "type_articles"
  add_foreign_key "articles", "type_formats"
  add_foreign_key "articles", "type_vehicles"
end
