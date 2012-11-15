class ColorsController < ApplicationController
  before_filter :authenticate
  layout 'admin'
  
  # GET /colors 
  def index
    @colors = Color.all
  end
  
  # GET /colors/new
  def new
    @color = Color.new
  end
  
  # POST /colors
  def create
    @color = Color.new(params[:color])
    respond_to do |format|
      if @color.save 
        flash[:notice] = "Color was successfully created"
        format.html { redirect_to color_path(@color.id)}
      else  
        format.html { render :action => "new" }
      end
    end
  end
  
  # GET /color/:id
  def show
    @color = Color.find(params[:id])
  end
  
  # GET /color/:id/edit
  def edit
    @color = Color.find(params[:id])
  end
  
  # PUT /color/:id
  def update
    @color = Color.find(params[:id])
    
    respond_to do |format|
      if @color.update_attributes(params[:color])
        format.html { redirect_to color_path(@color)}
      else
        format.html { render :action => "edit" }  
      end
    end
    
  end
  
  # DELETE /color/:id
  def destroy
    @color = Color.find(params[:id])
    @color.destroy
    respond_to do |format|
      format.html { redirect_to colors_path }
    end
  end
  
end
