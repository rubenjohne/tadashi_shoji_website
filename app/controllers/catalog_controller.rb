class CatalogController < ApplicationController
  
  def grid
    if Collection.exists?(params[:id])
      @collection = Collection.find(params[:id])
      @styles = @collection.styles
    end  
  end
  
  
  def slide
    
    if Collection.exists?(params[:id])
      @collection = Collection.find(params[:id])
      @styles = @collection.styles
      # get the first 3 styles 
      if @styles.length >= 3
        @style1 = @styles[0] 
        unless @style1.product_images.find_by_image_type(1).nil?
          @previmg =  @style1.product_images.find_by_image_type(1).image_filename
        else
          @previmg =  "blank.png"           
        end  
        @style2 = @styles[1] 
        unless @style2.product_images.find_by_image_type(1).nil?
          @bgimg =  @style2.product_images.find_by_image_type(1).image_filename
        else
          @bgimg =  "blank.png"           
        end  
        @style3 = @styles[2] 
        unless @style3.product_images.find_by_image_type(1).nil?
          @nextimg =  @style3.product_images.find_by_image_type(1).image_filename
        else
          @nextimg =  "blank.png"           
        end  
      else
        render  :action => :grid 
      end  
    end
        
  end
  
end
