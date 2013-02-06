require 'spec_helper'

describe Country do
  
  describe "Model Values" do
    before(:each) do
      @attr = {
        :country_name => "Philippines",
        :international => true
      }
    end
    
    it "should require country name" do
      no_name_country = Country.new(@attr.merge(:country_name => ""))
      no_name_country.should_not be_valid
    end
    
    it "should have true as the default international value" do
      default_interantional_country = Country.new()
      default_interantional_country.country_name = "USA"
      default_interantional_country.international.should == true 
    end
    
  end
  
  describe "model associations" do
    
    it "should have a states method" do
      Country.new.should respond_to(:states)
    end
    
    it "should have a retailers method" do
      Country.new.should respond_to(:retailers)
    end
    
  end
    
end
