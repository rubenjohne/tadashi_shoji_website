class CatalogController < ApplicationController
  
  def grid
    if Collection.exists?(params[:id])
      @collection = Collection.find(params[:id])
      @styles = @collection.styles
      @gridClass = "grid-active"
      @slideClass = "slide-inactive"
      @title = @collection.collection
    end  
  end
  
  
  def slide
    
    if Collection.exists?(params[:id])
      @collection = Collection.find(params[:id])
      @styles = @collection.styles
      @gridClass = "grid-inactive"
      @slideClass = "slide-active"      
      @title = @collection.collection
      # get the first 3 styles 
      if @styles.length >= 3
        @style1 = @styles[0]
        @style2 = @styles[1]
        @style3 = @styles[2]
      else
        render  :action => :grid 
      end  
    end
        
  end
  
  def video
    @collection = Collection.find(params[:id])
    @title = @collection.collection
    @gridClass = "grid-inactive"
    @slideClass = "slide-inactive"      
  end
  
end
