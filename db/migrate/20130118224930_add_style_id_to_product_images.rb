class AddStyleIdToProductImages < ActiveRecord::Migration
  def change
    add_column :product_images, :style_id, :integer
  end
  def down
    remove_column :product_images, :style_id, :integer
  end  
  
  
  
end
