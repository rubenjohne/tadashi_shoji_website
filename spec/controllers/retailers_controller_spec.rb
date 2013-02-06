require 'spec_helper'

describe RetailersController do
  
  describe "user not signed in" do
    
    it "should not be successful" do
      get :index
      response.should_not be_success
    end
    
  end
  
  describe "user signed in" do
    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
    end
    
    describe "GET 'index'" do
    
      it "should be successful" do
        get :index
        response.should be_success
      end      
    
    end
    
    describe "GET 'new'" do
      
      it "should be successful" do
        get :new
        response.should be_success 
      end
      
    end
    
    describe "POST 'create'" do
      before(:each) do
        @state = Factory(:state)
        @country = Factory(:country)
        @attr = {
          :store => "Tadashi",
          :address1 => "3016 E 44th St.",
          :address2 => "",
          :city => "Vernon",
          :state_id => @state.id,
          :zip_code => "90058",
          :country_id => @country.id
        }
      end
      
      
      it "should be successful" do
        lambda do
          post :create, :retailer => @attr
        end.should change(Retailer, :count).by(1)  
      end
      
    end
    
    describe "GET 'show'" do
      before(:each) do
        @state = Factory(:state)
        @country = Factory(:country)
        @retailer = Factory(:retailer)
      end

      it "should be successful" do
        get :show, :id => @retailer
        response.should be_success
      end

    end

    describe "GET 'edit'" do
      before(:each) do
        @state = Factory(:state)
        @country = Factory(:country)
        @retailer = Factory(:retailer)      
      end

      it "should be successful" do
        get :edit, :id => @retailer
        response.should be_success 
      end

    end
    
    describe "PUT 'update'" do
      before(:each) do
        @state = Factory(:state)
        @country = Factory(:country)
        @retailer = Factory(:retailer)      
        @attr = {
          :store => "Tadashi",
          :address1 => "3016 E 44th St.",
          :address2 => "",
          :city => "Vernon",
          :state_id => @state.id,
          :zip_code => "90058",
          :country_id => @country.id
        }
      end
      
      it "should be successful" do
        put :update, :id => @retailer, :retailer => @attr
        @retailer.reload
        @retailer.store.should == "Tadashi"
      end
      
    end
    
    describe "DELETE 'destroy'" do
      before(:each) do
        @state = Factory(:state)
        @country = Factory(:country)
        @retailer = Factory(:retailer)
      end
      
      it "should be successful" do
        lambda do
          delete :destroy, :id => @retailer
        end.should change(Retailer, :count).by(-1)  
      end
    end
    
  end
  

end
