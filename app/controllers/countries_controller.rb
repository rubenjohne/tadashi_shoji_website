class CountriesController < ApplicationController
  before_filter :authenticate 
  layout "admin"

  def index
    @countries = Country.all
  end
  
  def new
    @country = Country.new
  end  
  
  def create
    @country = Country.new(params[:country])
    
    respond_to do |format|
      if @country.save!
        format.html { redirect_to country_path(@country) }
      else
        format.html { render :action => "new" }
      end  
    end
      
  end
  
  def show
    @country = Country.find(params[:id])
  end

  def edit
    @country = Country.find(params[:id])
  end

  def update
    @country = Country.find(params[:id])
    
    respond_to do |format|
      if @country.update_attributes(params[:country])
        format.html { redirect_to country_path(@country)}
      else
        flash[:error] = @country.errors.full_messages.to_s        
        format.html { render :action => "edit" }
      end  
    end
    
  end
  
  def destroy
    @country = Country.find(1)
    @country.destroy
    respond_to do |format|
      format.html { redirect_to countries_path }
    end
  end
  
end
