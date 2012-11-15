require 'spec_helper'

describe ColorsController do
  render_views
  
    describe "user not signed in" do
 
      before(:each) do
        @color = Factory(:color)
      end
    
      describe "GET 'index'" do
        
        it "should not be successful" do
          get :index
          response.should_not be_success
        end
        
      end
      
      describe "GET 'new'" do
        
        it "should not be successful" do
          get :new
          response.should_not be_success
        end
      
      end
      
      describe "POST 'create'" do
        
        before(:each) do
          @attr = {:color_code => "black", :color_name => "black"}
        end
        
        it "should not be successful" do
          post :create, :color => @attr
          response.should_not be_success
        end
        
        it "should not create a new color record" do
          lambda do 
            post :create, :color => @attr
          end.should_not change(Color, :count)
        end
        
      end
      
      describe "GET 'show'" do
        

        it "should not be successful" do
          get :show, :id => @color
          response.should_not be_success
        end
        
      end
      
      describe "GET 'edit'" do
        
        it "should not be successful" do
          get :edit, :id => @color
          response.should_not be_success
        end
        
      end
      
      describe "PUT 'update'" do
      
        it "should not be successful" do
          put :update, :id => @color, :color => {}
          response.should_not be_success
        end
        
      end
      
      describe "DELETE 'destroy'" do
        
        it "should not be successful" do
          delete :destroy, :id => @color
          response.should_not be_success 
        end
        
        it "should not delete the color" do
          lambda do 
            delete :destroy, :id => @color
          end.should_not change(Color, :count)
        end
        
      end
      
    end
    
    describe "user is signed in" do
      
      before(:each) do
        @user = Factory(:user)
        test_sign_in(@user)
        @color = Factory(:color)        
      end
      
      describe "GET 'new'" do
        
        it "should be successful" do
          get :index
          response.should be_success
        end
    
        it "should load colors" do
          get :index
          assigns(:colors).should_not be_nil
        end

      end
      
      describe "GET 'new'" do
      
        it "should be successful" do
          get :new
          response.should be_success
        end
        
        it "should create a new color instance" do
          get :new
          assigns(:color).should be_a_new(Color)
        end
        
      end
      
      describe "POST 'create'" do
        
        before(:each) do
          @attr = {:color_code => "black", :color_name => "black"}
        end
        
        it "should redirect to the show size page" do
          post :create, :color => @attr
          response.should redirect_to(color_path(assigns(:color)))
        end
        
        it "should not create a new color record" do
          lambda do 
            post :create, :color => @attr
          end.should change(Color, :count).by(1)
        end
        
      end      
      
      describe "GET 'show'" do

        it "should be successful" do
          get :show, :id => @color
          response.should be_success
        end

      end
      
      describe "GET 'edit'" do
        
        it "should be successful" do
          get :edit, :id => @color
          response.should be_success
        end
        
        it "should get the color to edit" do
          get :edit, :id => @color
          assigns(:color).should be_a(Color)
        end
        
      end      
      
      describe "PUT 'update'" do
      
        it "should not be successful" do
          @attr = {:color_code => "White"}
          put :update, :id => @color, :color => @attr
          @color.reload
          @color.color_code.should == @attr[:color_code]          
        end
        
      end
      
      describe "DELETE 'destroy'" do
        
        it "should redirect to colors index" do
          delete :destroy, :id => @color
          response.should redirect_to(colors_path)
        end
        
        it "should delete the color" do
          lambda do 
            delete :destroy, :id => @color
          end.should change(Color, :count).by(-1)
        end
      
      end
      
    end 
    
end
