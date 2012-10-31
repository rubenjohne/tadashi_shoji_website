class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :collection

      t.timestamps
    end
  end
  def self.down
    drop_table :collections
  end  
end
