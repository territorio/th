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

ActiveRecord::Schema.define(:version => 20130208190942) do

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categories", ["name"], :name => "index_categories_on_name", :unique => true

  create_table "categories_events", :id => false, :force => true do |t|
    t.integer  "category_id", :null => false
    t.integer  "event_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories_events", ["category_id", "event_id"], :name => "index_categories_events_on_category_id_and_event_id", :unique => true

  create_table "events", :force => true do |t|
    t.string   "title",                                  :null => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.text     "body"
    t.date     "start_date",   :default => '2013-02-09', :null => false
    t.date     "end_date"
    t.boolean  "is_regular",   :default => true,         :null => false
    t.boolean  "is_monday",    :default => false,        :null => false
    t.boolean  "is_tuesday",   :default => false,        :null => false
    t.boolean  "is_wednesday", :default => false,        :null => false
    t.boolean  "is_thursday",  :default => false,        :null => false
    t.boolean  "is_friday",    :default => false,        :null => false
    t.boolean  "is_saturday",  :default => false,        :null => false
    t.boolean  "is_sunday",    :default => false,        :null => false
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

end
