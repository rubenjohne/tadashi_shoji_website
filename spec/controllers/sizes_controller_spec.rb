require 'spec_helper'

describe SizesController do
  render_views
  
  describe "user not signed in" do
  
      describe "GET 'index" do
        
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
        
        @attr = { :size_code => "test size code", :size_description => "test size description" }
        
        it "should not be successful" do
          lambda do
            post :create, :size => @attr
          end.should_not change(Size, :count)
        end
        
        it "should render the 'new' template" do
          post :create, :size => @attr
          response.should redirect_to(root_path) 
        end
        
      end
      
      describe "GET 'show'" do
        
        before(:each) do
          @size = Factory(:size)
        end
        
        it "should not be successful" do
          get :show, :id => @size 
          response.should_not be_success 
        end
        
      end
      
      describe "GET 'edit'" do
        
        before(:each) do
          @size = Factory(:size)
        end
        
        it "should not be successful" do
          get :edit, :id => @size 
          response.should_not be_success 
        end
        
      end
      
      describe "PUT 'update'" do
        
        before(:each) do
          @size = Factory(:size)
        end
        
        it "should not be successful" do
          put :update, :id => @size, :size => {}
          response.should_not be_success 
        end
        
      end
      
      describe "DELETE 'destroy'" do

        before(:each) do
          @size = Factory(:size)
        end
        
        it "should not be successful" do
          lambda do
            delete :destroy, :id => @size
          end.should_not change(Size, :count)  
        end
        
      end
        
  end
  
  describe "user is signed in" do
    
    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
      @size = Factory(:size)
    end
    
    describe "GET 'index'" do
    
      it "should be successful" do
        get :index
        response.should be_success
      end
      
      it "should get all the sizes" do
         get :index
         assigns(:sizes).should_not be_nil
       end
      
    end
    
    describe "GET 'new'" do
      
      it "should be successful" do
        get :new
        response.should be_success
      end
      
      it "should create a new instance of size" do
        get :new
        assigns(:size).should be_a_new(Size)
      end
    
    end

    describe "POST 'create'" do
      
      before(:each) do
        @attr = { :size_code => "test size code", :size_description => "test size description" }
      end
      
      it "should create a new size" do
        lambda do
          post :create, :size => @attr
        end.should change(Size, :count).by(1)
      end
      
      it "should redirect to the size show page" do
        post :create, :size => @attr
        response.should redirect_to(size_path(assigns(:size)))
      end
      
    end
    
    describe "GET 'show'" do
      
      it "should not be successful" do
        get :show, :id => @size 
        response.should be_success 
      end
      
    end
    
    describe "GET 'edit'" do
      
      it "should be successful" do
        get :edit, :id => @size
        response.should be_success
      end
    
    end

    describe "PUT 'update'" do
      
      before(:each) do
        @size = Factory(:size)
      end
      
      it "should be successful" do
        @attr = {:size_code => "Size code change"}
        put :update, :id => @size, :size => @attr
        @size.reload
        @size.size_code.should == @attr[:size_code]
      end
      
    end

    describe "DELETE 'destroy'" do

      before(:each) do
        @size = Factory(:size)
      end
      
      it "should be successful" do
        lambda do
          delete :destroy, :id => @size
        end.should change(Size, :count).by(-1)  
      end
      
    end
                
  end

end
