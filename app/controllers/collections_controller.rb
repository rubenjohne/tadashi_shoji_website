class CollectionsController < ApplicationController
  before_filter :authenticate
  layout 'admin'
  
  # GET /collections  
  def index
    @collections = Collection.all
  end

  # GET /collections/1
  def show
    @collection = Collection.find(params[:id])
  end

  # GET /collections/new
  def new
    @collection = Collection.new
  end

  # POST /collections
  def create
    @collection = Collection.new(params[:collection])

    respond_to do |format|
      if @collection.save
        flash[:notice] = "Collection was successfully created."

        format.html { redirect_to collection_path(@collection.id)}
      else
        format.html { render :action => "new"}
      end
    end
  end

  # GET /collections/1;edit
  def edit
    @collection = Collection.find(params[:id])
  end


  # PUT /collections/1
  def update
    @collection = Collection.find(params[:id])

    respond_to do |format|
      if @collection.update_attributes(params[:collection])
        format.html {redirect_to collection_url(@collection)}
      else
        format.html {render :action => "edit"}
      end
    end
  end

  # DELETE /collections/1
  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy
    respond_to do |format|
       format.html { redirect_to collections_url }
    end
  end

  
end
