class CreateRetailers < ActiveRecord::Migration
  def self.up
    create_table :retailers do |t|
      t.string :store
      t.string :address1
      t.string :address2
      t.string :city
      t.integer :country_id 
      t.integer :state_id
      t.string :zip_code

      t.timestamps
    end
  end
  
  def self.down
    drop_table :retailers
  end
end
