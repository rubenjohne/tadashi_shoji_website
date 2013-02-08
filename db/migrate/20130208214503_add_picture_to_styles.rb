class AddPictureToStyles < ActiveRecord::Migration
  def self.up
    add_attachment :styles, :picture
  end
  
  def self.down
    remove_attachment :styles, :picture
  end
end
