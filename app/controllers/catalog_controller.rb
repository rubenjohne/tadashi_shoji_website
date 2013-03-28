class CatalogController < ApplicationController
  
  def grid
    if Collection.exists?(:url => params[:url])
      @collection = Collection.find_by_url(params[:url])
      @styles = @collection.styles
      @gridClass = "grid-active"
      @slideClass = "slide-inactive"
      @title = @collection.collection
    end  
  end
  
  
  def slide
    
    if Collection.exists?(:url => params[:url])
      @collection = Collection.find_by_url(params[:url])
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
    @collection = Collection.find_by_url(params[:url])
    @title = @collection.collection
    @gridClass = "grid-inactive"
    @slideClass = "slide-inactive"      
  end
  
  def search
    @referer = request.referer
    @search = params[:search]
    @styles = Style.search(@search)
    unless @styles.nil? 
      if @styles.count > 0 
        render :grid
      else
        render :noresults  
      end  
    else
      redirect_to root_path
    end    
  end
  
end
