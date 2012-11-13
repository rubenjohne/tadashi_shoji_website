class SizesController < ApplicationController
  before_filter :authenticate 
  layout 'admin'
  
  # GET /collections
  def index
    @sizes = Size.all
  end
  
  # GET /collections/new
  def new
    @size = Size.new
  end

  # POST /collections
  def create
    @size = Size.new(params[:size])
    if @size.save
      redirect_to @size 
    else 
      render 'new'  
    end
  end
    
  # GET /collections/1   
  def show
    @size = Size.find(params[:id])
  end

  # GET /collections/1/edit
  def edit
    @size = Size.find(params[:id])
  end
  
  # PUT /collections/1
  def update
    @size = Size.find(params[:id])
    
    respond_to do |format|
      if @size.update_attributes(params[:size])
        format.html { redirect_to size_url(@size) }
      else
        format.html { render :action => "edit" } 
      end  
    end
    
  end
    
  # DELETE /collections/1
  def destroy
    @size = Size.find(params[:id])
    @size.destroy
    respond_to do |format| 
      format.html {redirect_to sizes_url }
    end
  end
  
end
