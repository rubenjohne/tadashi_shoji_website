class CatalogController < ApplicationController
  
  def grid
    if Collection.exists?(1)
      @collection = Collection.find(1)
      @styles = @collection.styles
    end  
  end
  
  
  def slide
    
    if Collection.exists?(1)
      @collection = Collection.find(1)
      @styles = @collection.styles
      # get the first 3 styles 
      @style1 = @styles[0]
      @style2 = @styles[1]
      @style3 = @styles[2]
    end
        
  end
  
end
