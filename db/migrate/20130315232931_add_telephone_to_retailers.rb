class AddTelephoneToRetailers < ActiveRecord::Migration
  def self.up
    add_column :retailers, :telephone, :string    
  end
  
  def self.down
    remove_column :retailers, :telephone
  end
  
end
