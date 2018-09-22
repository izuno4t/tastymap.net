class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
	    t.column "store_id",    :integer,                  :null => false
	    t.column "title",       :string
	    t.column "description", :text
	    t.column "filename",    :string,   :default => "", :null => false
	    t.column "created_at",  :datetime
	    t.column "created_by",  :integer

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
