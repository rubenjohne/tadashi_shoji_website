class AddPositionToStyles < ActiveRecord::Migration
  def self.up
    add_column :styles, :position, :integer
  end
  
  def self.down
    remove_column :styles, :position
  end
    
end
