class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.string :image_filename
      t.integer :image_type
      t.string :label

      t.timestamps
    end
  end
  
  def self.down
    drop_table :product_images
  end
end
