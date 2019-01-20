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

ActiveRecord::Schema.define(version: 2019_01_20_161746) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_shops", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "copies_in_stock", null: false
    t.index ["book_id", "shop_id"], name: "index_book_shops_on_book_id_and_shop_id"
    t.index ["book_id"], name: "index_book_shops_on_book_id"
    t.index ["shop_id"], name: "index_book_shops_on_shop_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "publisher_id"
    t.index ["publisher_id"], name: "index_books_on_publisher_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "books_sold_count", null: false
  end

  add_foreign_key "book_shops", "books"
  add_foreign_key "book_shops", "shops"
  add_foreign_key "books", "publishers"
end
