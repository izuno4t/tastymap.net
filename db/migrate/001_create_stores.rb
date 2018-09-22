class CreateStores < ActiveRecord::Migration
  def self.up
	  create_table :stores do |t|
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
	  end
  end

  def self.down
    drop_table :stores
  end
end
