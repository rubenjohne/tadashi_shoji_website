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
      @style1 = @styles[0] unless @styles[0].nil?
      @style2 = @styles[1] unless @styles[1].nil?
      @style3 = @styles[2] unless @styles[2].nil?
    end
        
  end
  
end
