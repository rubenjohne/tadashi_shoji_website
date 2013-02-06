class RetailersController < ApplicationController
  before_filter :authenticate, :except => [:list]
  layout 'admin'

  def index
    @retailers = Retailer.all
  end

  def new
    @retailer = Retailer.new
  end
  
  def create
    @retailer = Retailer.new(params[:retailer])
    
    respond_to do |format|
      if @retailer.save 
        format.html { redirect_to retailer_path(@retailer) }
      else
        format.html { render :action => :new }
      end  
    end
      
  end
  
  def list
    render :layout => 'application'    
  end
  
  def show
    @retailer = Retailer.find(params[:id])
    @retailer_map = @retailer.to_gmaps4rails
  end
  
  def edit
    @retailer = Retailer.find(params[:id])
  end
  
  def update
    @retailer = Retailer.find(params[:id])
    
    respond_to do |format|
      if @retailer.update_attributes(params[:retailer])
        format.html { redirect_to retailer_path(@retailer) }
      else
        format.html { render :action => :edit }  
      end  
    end  
    
  end
  
  def destroy
    @retailer = Retailer.find(params[:id])
    @retailer.destroy
    respond_to do |format|
      format.html { redirect_to retailers_path }
    end  
  end
  
end
