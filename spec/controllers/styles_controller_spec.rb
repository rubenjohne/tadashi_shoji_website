require 'spec_helper'

describe StylesController do
  render_views
  
  describe "user not signed in" do
    
    describe "GET 'index'" do
      
      it "should not be successful" do
        get :index, :collection_id => 1
        response.should_not be_success
      end
      
    end
    
    describe "GET 'new'" do
      
      it "should not be successful" do
        get :new, :collection_id => 1 
        response.should_not be_success
      end
      
    end
    
    describe "POST 'create'" do
      
      before(:each) do
        @attr = {:name => "EI8575L",
                 :price => 388,
                 :description => "chiffon beaded gown",
                 :collection_id => 1,
                 :color_id => 1,
                 :size_id => 1}
      end
      
      it "should not be successful" do
        post :create, :style => @attr, :collection_id => 1
        response.should_not be_success
      end
      
      it "should not change record count" do
        lambda do
          post :create, :style => @attr, :collection_id => 1
        end.should_not change(Style, :count)
      end
      
    end
    
    describe "GET 'edit'" do
      
      before(:each) do
        @style = Factory(:style)
      end
      
      it "should not be successful" do
        get :edit, :id => @style, :collection_id => 1
        response.should_not be_success
      end
      
    end
    
    describe "PUT 'update'" do

      before(:each) do
        @style = Factory(:style)
      end
      
      it "should not be successful" do
        @style.name = "ABC"
        put :update, :id => @style, :style => @style, :collection_id => 1
        @style.reload
        @style.name.should_not ==  "ABC"
      end
      
    end
    
    describe "DELETE 'destroy'" do
      
      before(:each) do
        @style = Factory(:style)
      end
      
      it "should not be successful" do
        lambda do
          delete :destroy, :id => @style, :collection_id => 1 
        end.should_not change(Style,:count)
      end
      
    end
    
    describe "GET 'show'" do
      
      before(:each) do
        @style = Factory(:style)
      end
      
      it "should not be successful" do
        get :show, :id => @style, :collection_id => 1
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
    end
     
    describe "GET 'index'" do
      
      it "should be successful" do
        get :index, :collection_id => @style.collection_id
        response.should be_success
      end
      
      it "should be nested with collections" do
        get :index, :collection_id => @style.collection_id
        controller.params[:collection_id].should_not be_nil
      end
      
      it "should load styles on the collection"
      
      it "should get all the styles" do
        get :index, :collection_id => @style.collection_id 
        assigns(:styles).should_not be_nil
      end
      
    end

    describe "GET 'new'" do
      
      it "should be successful" do
        get :new, :collection_id => @style.collection_id 
        response.should be_success
      end
      
    end

    describe "POST 'create'" do
      
      before(:each) do
        @attr = {:name => "EI8575L",
                 :price => 388,
                 :description => "chiffon beaded gown",
                 :collection_id => 1,
                 :color_id => 1,
                 :size_id => 1}
      end
      
      it "should redirect to the new style" do
        post :create, :style => @attr, :collection_id => 1
        response.should redirect_to(assigns(:style))
      end
      
      it "should change record count" do
        lambda do
          post :create, :style => @attr, :collection_id => 1
        end.should change(Style, :count).by(1)
      end
      
    end    

    describe "GET 'edit'" do
           
      it "should be successful" do
        get :edit, :id => @style, :collection_id => 1
        response.should be_success
      end
      
    end
    
    describe "PUT 'update'" do

      before(:each) do
        @style = Factory(:style)
      end
      
      it "should be successful" do
        @attr = {:name => "EI8575L",
                 :price => 388,
                 :description => "chiffon beaded gown",
                 :collection_id => 1,
                 :color_id => 1,
                 :size_id => 1}
        put :update, :id => @style, :style => @attr, :collection_id => 1
        @style.reload
        @style.name.should ==  "EI8575L"
      end
      
    end    
      
    describe "DELETE 'destroy'" do
      
      before(:each) do
        @style = Factory(:style)
      end
      
      it "should be successful" do
        lambda do
          delete :destroy, :id => @style, :collection_id => 1
        end.should change(Style, :count).by(-1)  
      end
      
      
    end  
        
  end
  
  
end
