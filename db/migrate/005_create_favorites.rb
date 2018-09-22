class CreateFavorites < ActiveRecord::Migration
  def self.up
    create_table :favorites, :id => false do |t|
    	t.column :store_id, :integer
    	t.column :user_id, :integer
    end
    add_index :favorites, :store_id
    add_index :favorites, :user_id
    add_column :stores, :open, :string
    add_column :stores, :close, :string
  end

  def self.down
    drop_table :favorites
    remove_column :stores, :open
    remove_column :stores, :close
  end
end
