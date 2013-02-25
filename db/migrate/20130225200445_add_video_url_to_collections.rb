class AddVideoUrlToCollections < ActiveRecord::Migration
  def self.up
    add_column :collections, :video_url, :string
  end
  
  def self.down
    remove_column :collections, :video_url   
  end
end
