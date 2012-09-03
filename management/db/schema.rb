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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120902231333) do

  create_table "books", :force => true do |t|
    t.integer  "price"
    t.integer  "data_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "books", ["data_id"], :name => "index_books_on_data_id"

  create_table "buyers", :force => true do |t|
    t.integer  "person_id"
    t.integer  "book_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "buyers", ["book_id"], :name => "index_buyers_on_book_id"
  add_index "buyers", ["person_id"], :name => "index_buyers_on_person_id"

  create_table "data", :force => true do |t|
    t.string   "isbn"
    t.string   "title"
    t.string   "author"
    t.string   "edition"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "flags", :force => true do |t|
    t.string   "key"
    t.boolean  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "uniqname"
    t.string   "umid"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sellers", :force => true do |t|
    t.integer  "person_id"
    t.integer  "book_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sellers", ["book_id"], :name => "index_sellers_on_book_id"
  add_index "sellers", ["person_id"], :name => "index_sellers_on_person_id"

end
