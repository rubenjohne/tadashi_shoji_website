require 'spec_helper'

describe CountriesController do
  render_views
  
  describe "user not signed in" do
    
    describe "GET 'index'" do
    
      it "should  not be successful" do
        get :index
        response.should_not be_success 
      end
      
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
        @attr = {
          :country_name => "Philippines"
        }
      end
      
      it "should create the country record" do
        lambda do
          post :create, :country => @attr
        end.should change(Country, :count).by(1)  
      end
      
    end
    
    describe "GET 'show'" do
      before(:each) do
        @country = Factory(:country)
      end
      
      it "should be successful" do
        get :show, :id => @country.id
        response.should be_success 
      end
      

    end
    
    describe "GET 'edit'" do
      before(:each) do
        @country = Factory(:country)
      end
      
      it "should be successful" do
        get :edit, :id => @country
        response.should be_success 
      end
      
    end
    
    describe "PUT 'update'" do
      before(:each) do
        @country = Factory(:country)
      end
      
      it "should be successful" do
        @attr = {
          :country_name => "United States",
          :international => false
        }
        put :update, :id => @country, :country => @attr
        @country.reload 
        @country.country_name.should == "United States"
      end
      
    end
    
    describe "DELETE 'destroy'" do
      before(:each) do
        @country = Factory(:country)
      end
      
      it "should be successful" do
        lambda do
          delete :destroy, :id => @country
        end.should change(Country, :count).by(-1)
      end
      
    end
    
    
  end  

end
