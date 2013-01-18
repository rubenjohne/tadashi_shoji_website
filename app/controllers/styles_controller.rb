class StylesController < ApplicationController
  before_filter :authenticate
  layout 'admin'
  
  # GET styles/
  def index 
    # get the styles in the collection 
    @collection = Collection.find(params[:collection_id])
    @styles = @collection.styles
  end
  
  # GET styles/new/
  def new
    @style = Style.new
  end
  
  # GET styles/:id
  def show
    @style = Style.find(params[:id])
  end
  
  # POST styles/
  def create
    @style = Style.new(params[:style])
    
    respond_to do |format|
      if @style.save 
        format.html { redirect_to collection_style_path(@style.id) }
      else 
        format.html { render :action => :new}  
      end
    end    
  end
  
  # GET styles/:id;edit
  def edit
    @style = Style.find(params[:id])
  end
  
  # PUT styles/:id
  def update
    @style = Style.find(params[:id])
    
    respond_to do |format|
      if @style.update_attributes(params[:style])
        format.html { redirect_to collection_style_url(@style) }
      else
        format.html { render :action => "edit" }
      end
    end
    
  end
  
  # DELETE styles/:id
  def destroy
    @style = Style.find(params[:id])
    @style.destroy
    respond_to do |format|
      format.html { redirect_to collection_styles_url }
    end
  end
      
end
