require 'spec_helper'

describe "Users" do

  describe "signup" do
    
    describe "failure" do
      
      it "should not make a new user" do
        lambda do
          visit new_user_path
          fill_in :user_username,               :with => ""
          fill_in :user_email,                   :with => ""
          fill_in :user_password,                 :with => ""
          fill_in :user_password_confirmation,   :with => ""
          click_button
          response.should render_template('users/new')
          response.should have_selector("div#error_explanation")
        end.should_not change(User, :count)  
      end
      
    end
    
  end


end
