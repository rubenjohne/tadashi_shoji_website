class ProductImagesController < ApplicationController
  before_filter :authenticate
  layout 'admin'
  
  def index
    @style = Style.find(params[:style_id])
    @color = Color.find(@style.color_id)
    @product_images = @style.product_images
    @product_image_base = nil
    @product_image_small = nil
    @product_image_thumbnail = nil
    @product_images.each do |product_image| 
      if product_image.image_type == 1
        @product_image_base = product_image  
      elsif product_image.image_type == 2
        @product_image_small = product_image      
      else
        @product_image_thumbnail = product_image  
      end  
    end
  end
  
  def create
    @style = Style.find(params[:style_id])
    @product_image = @style.product_images.build(params[:product_image])
    @product_image.image_filename = params[:product_image][:image_filename].original_filename unless params[:product_image][:image_filename].nil?
    # delete previous image_type images there could only be one type per image
    @product_images_same_type = ProductImage.find_by_image_type(@product_image.image_type)
    unless @product_images_same_type.nil?
      @product_images_same_type.destroy
    end  
    respond_to do |format|
      if @product_image.save!
        # upload the file here
        upload_file(params[:product_image][:image_filename], @product_image)
        format.html { redirect_to collection_style_product_images_path(@product_image.style.collection_id, @product_image.style)}
      end    
    end    
  end
  
  
  private 
  
  # method to create the directory if it doesn't exits
  def create_directory_if_not_exist(directory_name)
    Dir.mkdir(directory_name) unless File.exists?(directory_name)
  end
  
  # method to updload the file
  def upload_file(uploaded_file, product_image)
    # check if directory exist if not create it use the helper to create the folder
    directory_name = Rails.root.join('public', 'uploads', product_image.style.collection.collection)
    create_directory_if_not_exist(directory_name)    
    unless uploaded_file.nil?    
      File.open(directory_name.join(product_image.image_filename), 'wb') do |file|
        file.write(uploaded_file.read)    
      end      
    end  
  end
  
  
end
