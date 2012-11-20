class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.integer :collection_id
      t.integer :color_id
      t.integer :size_id
      t.string :name
      t.float :price
      t.string :description

      t.timestamps
    end
  end
  def self.down
    drop_table :styles
  end  
end
