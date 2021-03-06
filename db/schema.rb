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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130315232931) do

  create_table "collections", :force => true do |t|
    t.string   "collection"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "video_url"
    t.string   "url"
  end

  add_index "collections", ["url"], :name => "index_collections_on_url"

  create_table "colors", :force => true do |t|
    t.string   "color_code"
    t.string   "color_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "countries", :force => true do |t|
    t.string   "country_name"
    t.boolean  "international", :default => true
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "product_images", :force => true do |t|
    t.string   "image_filename"
    t.integer  "image_type"
    t.string   "label"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "style_id"
  end

  create_table "retailers", :force => true do |t|
    t.string   "store"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.integer  "country_id"
    t.integer  "state_id"
    t.string   "zip_code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "telephone"
  end

  create_table "sizes", :force => true do |t|
    t.string   "size_code"
    t.string   "size_description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "states", :force => true do |t|
    t.string   "state_code"
    t.string   "state"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "country_id"
  end

  create_table "styles", :force => true do |t|
    t.integer  "collection_id"
    t.integer  "color_id"
    t.integer  "size_id"
    t.string   "name"
    t.float    "price"
    t.string   "description"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "position"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "encrypted_password"
    t.string   "salt"
  end

end
