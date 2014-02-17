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

ActiveRecord::Schema.define(:version => 20140217204152) do

  create_table "categories", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "restaurants", :force => true do |t|
    t.string   "name",                         :null => false
    t.string   "website"
    t.string   "price"
    t.string   "phone"
    t.string   "street",                       :null => false
    t.string   "city",                         :null => false
    t.string   "state",                        :null => false
    t.string   "zip"
    t.boolean  "open",       :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "reviews", :force => true do |t|
    t.string   "title",         :null => false
    t.text     "body",          :null => false
    t.integer  "user_id",       :null => false
    t.integer  "restaurant_id", :null => false
    t.integer  "rating",        :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "reviews", ["restaurant_id"], :name => "index_reviews_on_restaurant_id"
  add_index "reviews", ["user_id"], :name => "index_reviews_on_user_id"

  create_table "tags", :force => true do |t|
    t.integer  "category_id",   :null => false
    t.integer  "restaurant_id", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "tags", ["category_id"], :name => "index_tags_on_category_id"
  add_index "tags", ["restaurant_id"], :name => "index_tags_on_restaurant_id"

  create_table "users", :force => true do |t|
    t.string   "username",                           :null => false
    t.string   "password_digest",                    :null => false
    t.string   "email",                              :null => false
    t.text     "biography"
    t.integer  "age"
    t.string   "gender"
    t.string   "ethnicity"
    t.string   "location"
    t.boolean  "admin",           :default => false
    t.string   "session_token",                      :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
