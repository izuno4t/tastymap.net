# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 6) do

  create_table "accounts", :force => true do |t|
    t.column "login",           :string,   :limit => 80, :default => "", :null => false
    t.column "salted_password", :string,   :limit => 40, :default => "", :null => false
    t.column "email",           :string,   :limit => 60, :default => "", :null => false
    t.column "firstname",       :string,   :limit => 40
    t.column "lastname",        :string,   :limit => 40
    t.column "salt",            :string,   :limit => 40, :default => "", :null => false
    t.column "verified",        :integer,                :default => 0
    t.column "role",            :string,   :limit => 40
    t.column "security_token",  :string,   :limit => 40
    t.column "token_expiry",    :datetime
    t.column "created_at",      :datetime
    t.column "updated_at",      :datetime
    t.column "logged_in_at",    :datetime
    t.column "deleted",         :integer,                :default => 0
    t.column "delete_after",    :datetime
    t.column "logged_in_from",  :string,   :limit => 20
    t.column "user_agent",      :string
    t.column "screenname",      :string,   :limit => 40
    t.column "buddyicon",       :string
    t.column "description",     :text
  end

  create_table "favorites", :id => false, :force => true do |t|
    t.column "store_id", :integer
    t.column "user_id",  :integer
  end

  add_index "favorites", ["store_id"], :name => "index_favorites_on_store_id"
  add_index "favorites", ["user_id"], :name => "index_favorites_on_user_id"

  create_table "photos", :force => true do |t|
    t.column "store_id",    :integer,                  :null => false
    t.column "title",       :string
    t.column "description", :text
    t.column "filename",    :string,   :default => "", :null => false
    t.column "created_at",  :datetime
    t.column "created_by",  :integer
  end

  create_table "stores", :force => true do |t|
    t.column "name",       :string,                 :default => "", :null => false
    t.column "category",   :string,                 :default => "", :null => false
    t.column "lat",        :string,                 :default => "", :null => false
    t.column "lng",        :string,                 :default => "", :null => false
    t.column "url",        :string
    t.column "review",     :string
    t.column "note",       :text
    t.column "address",    :string
    t.column "tel",        :string,   :limit => 20
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
    t.column "user_id",    :integer
    t.column "open",       :string
    t.column "close",      :string
  end

  create_table "taggings", :force => true do |t|
    t.column "tag_id",        :integer
    t.column "taggable_id",   :integer
    t.column "taggable_type", :string
    t.column "created_at",    :datetime
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.column "name", :string
  end

end