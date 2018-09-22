class AddColumnsAccount < ActiveRecord::Migration
  def self.up
    add_column "accounts", "logged_in_from",  :string,   :limit => 20
    add_column "accounts", "user_agent",      :string
    add_column "accounts", "screenname",      :string,   :limit => 40
    add_column "accounts", "buddyicon",       :string
    add_column "accounts", "description",     :text
    #add_column "stores",   "created_at",      :datetime,  :null => false
    #add_column "stores",   "updated_at",      :datetime,  :null => false
    #add_column "stores",   "user_id",         :integer,   :null => false
  end

  def self.down
    remove_column "accounts", "logged_in_from"
    remove_column "accounts", "user_agent"
    remove_column "accounts", "screenname"
    remove_column "accounts", "buddyicon"
    remove_column "accounts", "description"
    #remove_column "stores",   "created_at"
    #remove_column "stores",   "updated_at"
    #remove_column "stores",   "user_id"
  end
end
