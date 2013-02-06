class StatesController < ApplicationController
  before_filter :authenticate
  layout 'admin'

  def index
    @states = Country.find(params[:country_id]).states
  end

  def new
    @state = State.new
  end

  def create
    @country = Country.find(params[:country_id])
    @state = @country.states.build(params[:state])
    respond_to do |format|
      if @state.save
        format.html { redirect_to country_state_path(@state.country_id, @state) }
      else
        format.html { render :action => :new }
      end
    end  
  end
  
  def show
    @state = State.find(params[:id])
  end
  
  def edit
    @state = State.find(params[:id])
  end
  
  def update
    @state = State.find(params[:id])
    
    respond_to do |format|
      if @state.update_attributes(params[:state])
        format.html { redirect_to country_state_path(@state.country_id, @state) }
      else 
        format.html { render :action => :edit }
      end  
    end  
  end
  
  def destroy
    @state = State.find(params[:id])
    @state.destroy
    respond_to do |format|
      format.html { redirect_to country_states_path }
    end
  end
  
end
