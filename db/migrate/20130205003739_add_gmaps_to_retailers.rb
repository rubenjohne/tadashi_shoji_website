class AddGmapsToRetailers < ActiveRecord::Migration
  def self.up
    add_column :retailers, :latitude, :float
    add_column :retailers, :longitude, :float
    add_column :retailers, :gmaps, :boolean
  end
  
  def self.down
    remove_column :retailers, :latitude
    remove_column :retailers, :longitude
    remove_column :retailers, :gmaps
  end
end
