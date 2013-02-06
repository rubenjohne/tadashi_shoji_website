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
  
end
