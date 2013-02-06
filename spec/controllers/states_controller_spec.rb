require 'spec_helper'

describe StatesController do

  describe "User not signed in" do
  
    describe "GET 'index'" do
      
      it "should not be successful" do
        get :index, :country_id => 1
        response.should_not be_success
      end
      
    end  
    
  end


  describe "User signed in" do
    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
      @country = Factory(:country)
      @state = Factory(:state)
    end
    
    describe "GET 'index'" do
      
      it "should be successful" do
        get :index, :country_id => 1
        response.should be_success
      end
      
      it "should list states the belongs to the country" do
        get :index, :country_id => @country.id
        assigns(:states)[0].country_id.should == 1
      end
      
    end  
    
    describe "GET 'new'" do
      
      it "should be successful" do
        get :new, :country_id => 1
        response.should be_success
      end
      
    end  

    describe "POST 'create'" do
      before(:each) do
        @attr = {
          :country_id => @country.id,
          :state_code => "CA",
          :state => "California"
        }
      end
      
      it "should be successful" do
        lambda do
          post :create, :state => @attr, :country_id => @country
        end.should change(State, :count).by(1)  
      end
      
    end  
    
    describe "GET 'edit'" do
      
      it "should be successful" do
        get :edit, :id => @state, :country_id => 1
        response.should be_success
      end
      
    end

    describe "PUT 'update'" do
      before(:each) do
        @attr = {
          :country_id => @country.id,
          :state_code => "NY",
          :state => "New York"
        }
        @state = Factory(:state)
      end
      
      it "should be successful" do
        put :update, :id => @state, :state => @attr, :country_id => 1
        @state.reload 
        @state.state_code.should == "NY"
      end
      
    end
    
    describe "DELETE 'destroy'" do
      
      it "should be successful" do
        lambda do
          delete :destroy, :id => @state, :country_id => 1
        end.should change(State, :count).by(-1)  
      end
      
    end
    
  end

  
end
