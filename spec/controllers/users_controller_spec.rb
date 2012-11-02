require 'spec_helper'

describe UsersController do
  render_views
  
  describe "GET 'show'" do
    
    before(:each) do
      @user = Factory(:user)
    end
    
    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end
    
    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end
  end
  
  describe "GET 'new'" do
  
    it "should be successful" do
      get :new 
      response.should be_success
    end
    
  end
  
  describe "POST 'create'" do
    
    describe "success" do
      before(:each) do
        @attr = {:username => "New User", :email => "user@example.com", :password => "user1234", :password_confirmation => "user1234"}
      end
      
      it "should create a user" do
        lambda do 
          post :create, :user => @attr
        end.should change(User, :count).by(1)
      end
      
      it "should redirect to the user show page" do
        post :create, :user => @attr
        response.should redirect_to(user_path(assigns(:user)))
      end
      
      it "should have a created message" do
        post :create, :user => @attr
        flash[:success].should =~  /user created/i
      end
      
    end
    
    describe "failure" do
      
      before(:each) do
        @attr = {:username => "", :email => "", :password => "", :password_confirmation => ""}
      end
      
      it "should not create a user" do
        lambda do 
          post :create, :user => @attr
        end.should_not change(User, :count)
      end
      
      it "should render the new page" do
        post :create, :user => @attr
        response.should render_template(:new)
      end
      
    end
    
  end
  
end
