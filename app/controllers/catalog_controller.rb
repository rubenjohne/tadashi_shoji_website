class CatalogController < ApplicationController
  
  def grid
    if Collection.exists?(1)
      @collection = Collection.find(1)
      @styles = @collection.styles
    end  
  end
  
end
