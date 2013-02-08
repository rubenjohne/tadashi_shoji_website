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
        @previmg = @styles[0].picture.url(:base)
        @bgimg = @styles[1].picture.url(:base)
        @nextimg = @styles[2].picture.url(:base)
      else
        render  :action => :grid 
      end  
    end
        
  end
  
end
