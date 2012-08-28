require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'home'
      response.should have_selector("title", :content => "Home | Tadashi Shoji")
    end
    
  end

  describe "GET 'collections'" do
    
    it "should be successful" do
      get 'collections'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'collections'
      response.should have_selector("title", :content => "Collections | Tadashi Shoji")
    end

  end

end
