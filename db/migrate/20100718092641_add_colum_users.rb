class AddColumUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :firstname, :string,   :limit => 40
    add_column :users, :lastname,        :string,   :limit => 40
    add_column :users, :logged_in_at,    :datetime
    add_column :users, :logged_in_from,  :string,   :limit => 20
    add_column :users, :user_agent,      :string
    add_column :users, :screenname,      :string,   :limit => 40
    add_column :users, :buddyicon,       :string
    add_column :users, :description,     :text
  end

  def self.down
    remove_column :users, :firstname
    remove_column :users, :lastname
    remove_column :users, :logged_in_at
    remove_column :users, :logged_in_from
    remove_column :users, :user_agent
    remove_column :users, :screenname
    remove_column :users, :buddyicon
    remove_column :users, :description
  end
end
