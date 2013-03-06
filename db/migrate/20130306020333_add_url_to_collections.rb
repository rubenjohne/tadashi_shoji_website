class AddUrlToCollections < ActiveRecord::Migration
  def self.up
    add_column :collections, :url, :string
    add_index :collections, :url
  end
  
  def self.down
    remove_column :collections, :url
    remove_index :collections, :url    
  end
end
