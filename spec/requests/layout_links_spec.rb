require 'spec_helper'

describe "LayoutLinks" do
  
  describe "when signed in" do
    before(:each) do
      @user = Factory(:user)
      visit signin_path 
      fill_in :email,     :with => @user.email
      fill_in :password,  :with => @user.password
      click_button
    end
    
    it "should have a sign out link" do
      visit root_path 
      response.should have_selector("a", :href => signout_path, :content => "Sign out")
    end
    
  end
  
end