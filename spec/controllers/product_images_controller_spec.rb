require 'spec_helper'

describe ProductImagesController do

  describe "user not signed in" do
    
    describe "GET 'index'" do
      
      it "should not be successful" do
        get :index, :collection_id => 1, :style_id => 1
        response.should_not be_success 
      end
      
    end
    
  end

  describe "user signed in" do
    
    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
      @style = Factory(:style)
      @collection = Factory(:collection)
      @color = Factory(:color)
    end
    
    describe "GET 'index'" do
      
      it "should be successful" do
        get :index, :collection_id => 1, :style_id => 1
        response.should be_success 
      end
      
      it "should display style information" do
        get :index, :collection_id => @collection.id, :style_id => @style.id
        assigns(:style).should_not be_nil
      end
      
      it "should display color information" do
        get :index, :collection_id => @collection.id, :style_id => @style.id
        assigns(:color).should_not be_nil
      end
      
      it "should display product image information" do
        get :index, :collection_id => @collection.id, :style_id => @style.id
        assigns(:product_images).should_not be_nil        
      end
      
    end
    
    describe "POST 'create'" do
      before(:each) do
        @file = File.new("testfile", "w+")     
        @attr = { :image_filename => "image.jpg",
                   :image_type => 1,
                   :label => "test image",
                   :style_id => 1
                 }
      end
      
      it "should be successful" do
        post :create, :product_image => @attr, :collection_id => 1, :style_id => 1, :file => @file
        response.should redirect_to collection_style_path(1, 1)
      end
      
      it "should display a flash error if it's not successful" do
        
      end
      
      it "should upload the image in the public uploads folder"
      
      
      
    end
    
    
  end
  
end
