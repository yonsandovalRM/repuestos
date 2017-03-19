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

ActiveRecord::Schema.define(version: 20170314174303) do

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
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.datetime "deleted_at"
    t.index ["brand_id"], name: "index_articles_on_brand_id", using: :btree
    t.index ["deleted_at"], name: "index_articles_on_deleted_at", using: :btree
    t.index ["type_article_id"], name: "index_articles_on_type_article_id", using: :btree
    t.index ["type_format_id"], name: "index_articles_on_type_format_id", using: :btree
    t.index ["type_vehicle_id"], name: "index_articles_on_type_vehicle_id", using: :btree
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "communes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "run"
    t.string   "name"
    t.string   "address"
    t.string   "commune"
    t.string   "city"
    t.string   "phone"
    t.string   "phone2"
    t.string   "email"
    t.string   "status"
    t.string   "b_rut"
    t.string   "b_name"
    t.string   "b_address"
    t.string   "b_commune"
    t.string   "b_activity"
    t.string   "b_phone"
    t.string   "b_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.integer  "article_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["article_id"], name: "index_pictures_on_article_id", using: :btree
  end

  create_table "purchase_details", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "stock"
    t.integer  "stock_store"
    t.integer  "pin"
    t.integer  "purchase_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["article_id"], name: "index_purchase_details_on_article_id", using: :btree
    t.index ["purchase_id"], name: "index_purchase_details_on_purchase_id", using: :btree
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "supplier_id"
    t.string   "number_doc"
    t.integer  "type_document_id"
    t.datetime "date_doc"
    t.string   "observation"
    t.string   "status"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "payment_method_id"
    t.string   "status_payment"
    t.integer  "status_payment_id"
    t.index ["payment_method_id"], name: "index_purchases_on_payment_method_id", using: :btree
    t.index ["status_payment_id"], name: "index_purchases_on_status_payment_id", using: :btree
    t.index ["supplier_id"], name: "index_purchases_on_supplier_id", using: :btree
    t.index ["type_document_id"], name: "index_purchases_on_type_document_id", using: :btree
  end

  create_table "quotation_details", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "stock"
    t.integer  "pou"
    t.integer  "discount"
    t.integer  "quotation_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["article_id"], name: "index_quotation_details_on_article_id", using: :btree
    t.index ["quotation_id"], name: "index_quotation_details_on_quotation_id", using: :btree
  end

  create_table "quotations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "payment_method_id"
    t.string   "number_doc"
    t.integer  "type_document_id"
    t.integer  "status_payment_id"
    t.string   "observation"
    t.integer  "customer_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["customer_id"], name: "index_quotations_on_customer_id", using: :btree
    t.index ["payment_method_id"], name: "index_quotations_on_payment_method_id", using: :btree
    t.index ["status_payment_id"], name: "index_quotations_on_status_payment_id", using: :btree
    t.index ["type_document_id"], name: "index_quotations_on_type_document_id", using: :btree
    t.index ["user_id"], name: "index_quotations_on_user_id", using: :btree
  end

  create_table "sale_details", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "stock"
    t.integer  "stock_store"
    t.integer  "pou"
    t.integer  "discount"
    t.integer  "sale_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["article_id"], name: "index_sale_details_on_article_id", using: :btree
    t.index ["sale_id"], name: "index_sale_details_on_sale_id", using: :btree
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "payment_method_id"
    t.string   "number_doc"
    t.integer  "type_document_id"
    t.integer  "status_payment_id"
    t.string   "observation"
    t.integer  "customer_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["customer_id"], name: "index_sales_on_customer_id", using: :btree
    t.index ["payment_method_id"], name: "index_sales_on_payment_method_id", using: :btree
    t.index ["status_payment_id"], name: "index_sales_on_status_payment_id", using: :btree
    t.index ["type_document_id"], name: "index_sales_on_type_document_id", using: :btree
    t.index ["user_id"], name: "index_sales_on_user_id", using: :btree
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "status_payments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "rut"
    t.string   "bname"
    t.string   "address"
    t.string   "commune"
    t.string   "city"
    t.string   "activity"
    t.string   "phone"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context", using: :btree
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end

  create_table "type_articles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_documents", force: :cascade do |t|
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

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "isadmin"
    t.string   "username"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "articles", "brands"
  add_foreign_key "articles", "type_articles"
  add_foreign_key "articles", "type_formats"
  add_foreign_key "articles", "type_vehicles"
  add_foreign_key "pictures", "articles"
  add_foreign_key "purchase_details", "articles"
  add_foreign_key "purchase_details", "purchases"
  add_foreign_key "purchases", "payment_methods"
  add_foreign_key "purchases", "status_payments"
  add_foreign_key "purchases", "suppliers"
  add_foreign_key "purchases", "type_documents"
  add_foreign_key "quotation_details", "articles"
  add_foreign_key "quotation_details", "quotations"
  add_foreign_key "quotations", "customers"
  add_foreign_key "quotations", "payment_methods"
  add_foreign_key "quotations", "status_payments"
  add_foreign_key "quotations", "type_documents"
  add_foreign_key "quotations", "users"
  add_foreign_key "sale_details", "articles"
  add_foreign_key "sale_details", "sales"
  add_foreign_key "sales", "customers"
  add_foreign_key "sales", "payment_methods"
  add_foreign_key "sales", "status_payments"
  add_foreign_key "sales", "type_documents"
  add_foreign_key "sales", "users"
end
