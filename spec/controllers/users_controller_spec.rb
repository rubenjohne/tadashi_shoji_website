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
      
      it "should sign the user in" do
        post :create, :user => @attr
        controller.should be_signed_in
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
  
  describe "authentication of edit/update pages" do
    
    before(:each) do
      @user = Factory(:user)
    end
    
    describe "for non-signed-in users" do
      
      it "should deny access to 'edit'" do
        get :edit, :id => @user
        response.should redirect_to('/')
      end
      
      it "should deny access to 'update'" do
        get :update, :id => @user, :user => {}
        response.should redirect_to('/')
      end
      
    end
    
    describe "for signed-in users" do
      
      before(:each) do
        wrong_user = Factory(:user, :email => "user@example.net")
        test_sign_in(wrong_user)
      end
      
      it "should require matching users for 'edit'" do
        get :edit, :id => @user
        response.should redirect_to(root_path)
      end
      

      it "should require matching users for 'update'" do
        put :update, :id => @user, :user => {}
        response.should redirect_to(root_path)
      end
  
    end
    
  end
  
end
