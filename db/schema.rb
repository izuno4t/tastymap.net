# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100718092641) do

  create_table "favorites", :force => true do |t|
    t.integer  "store_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.integer  "store_id",                    :null => false
    t.string   "title"
    t.text     "description"
    t.string   "filename",    :default => "", :null => false
    t.datetime "created_at"
    t.integer  "created_by"
    t.datetime "updated_at"
  end

  create_table "stores", :force => true do |t|
    t.string   "name",                     :default => "", :null => false
    t.string   "category",                 :default => "", :null => false
    t.string   "lat",                      :default => "", :null => false
    t.string   "lng",                      :default => "", :null => false
    t.string   "url"
    t.string   "review"
    t.text     "note"
    t.string   "address"
    t.string   "tel",        :limit => 20
    t.string   "open"
    t.string   "close"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "firstname",                 :limit => 40
    t.string   "lastname",                  :limit => 40
    t.datetime "logged_in_at"
    t.string   "logged_in_from",            :limit => 20
    t.string   "user_agent"
    t.string   "screenname",                :limit => 40
    t.string   "buddyicon"
    t.text     "description"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
