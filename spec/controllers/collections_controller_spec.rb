require 'spec_helper'

describe CollectionsController do
  render_views
  
  
  describe "user not signed in" do
    
    
    describe "GET 'index'" do
      
      it "should not be successful" do
        get :index
        response.should_not be_success 
      end
      
      
    end
    
    describe "GET 'show'" do
      
      before(:each) do
        @collection = Factory(:collection)
      end

      it "should not be successful" do
        get :show, :id => @collection 
        response.should_not be_success 
      end
      
    end
    
    describe "GET 'edit'" do

      before(:each) do
        @collection = Factory(:collection)
      end
      
      it "should not be successful" do
        get :edit, :id => @collection
        response.should_not be_success
      end
      
    end
    
    describe "PUT 'update'" do

      before(:each) do
        @collection = Factory(:collection)
      end
      
      it "should not be successful" do
        put :update, :id => @collection, :collection => {}
        response.should_not be_success
      end
      
    end
    
    describe "POST 'create'" do
      
      before(:each) do
        @attr = {:collection => "Tadashi Shoji Fall 2012"}
      end
      
      it "should not be successful" do
        lambda do
          post :create, :collection => @attr
        end.should_not change(Collection, :count)
      end
      
    end

  end
  
  describe "user signed in" do
    
    before(:each) do
      @user = Factory(:user) 
      @collection = Factory(:collection)
      test_sign_in(@user)
    end
    
    describe "GET 'index'" do
    
      it "should be successful" do
        get :index
        response.should be_success
      end
    
      it "should display all the collections" do
        get :index
        assigns(:collections).should_not be_nil
      end
            
    end
    
    describe "GET 'edit'" do
      
      it "should be successful" do
        get :edit, :id => @collection
        response.should be_success 
      end
      
    end
    
    
    describe "GET 'delete'" do
      
      it "should be successful" do
        lambda do
          delete :destroy, :id => @collection
        end.should change(Collection, :count).by(-1)  
      end
      
      it "should not delete if there are styles within the collection" 
      
    end
    
    describe "PUT 'update'" do
      
      it "should be successful" do
        @attr = {:collection => "Tadashi"}
        put :update, :id => @collection, :collection => @attr
        @collection.reload
        @collection.collection.should == @attr[:collection]
      end
      
    end
    
    describe "GET 'show'" do
      
      it "should be successful" do
        get :show, :id => @collection
        response.should be_success
      end
      
    end

    describe "POST 'create'" do
      
      it "should be successful" do
        lambda do
          @attr = {:collection => "Collection"}
          post :create, :collection => @attr
        end.should change(Collection, :count).by(1)
      end
      
    end
    
    describe "GET 'new'" do
      
      it "should be successful" do
        get :new
        response.should be_success
      end
      
    end
    
  end
  
end
