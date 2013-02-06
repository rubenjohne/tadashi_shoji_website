require 'spec_helper'

describe Retailer do

  describe "Model vaidations" do
    before(:each) do
      @state = Factory(:state)
      @country = Factory(:country)
      @attr = {
        :store => "Tadashi",
        :address1 => "3016 E 44th st",
        :address2 => "",
        :city => "Vernon",
        :state_id => @state.id,
        :country_id => @country.id,
        :zip_code => "90058" 
      }
    end
    
    it "should require a store name" do
      no_store_retailer = Retailer.new(@attr.merge(:store => ""))
      no_store_retailer.should_not be_valid 
    end
    
    it "should require an address 1" do
      no_address1_retailer = Retailer.new(@attr.merge(:address1 => ""))
      no_address1_retailer.should_not be_valid
    end
    
    it "should require a city" do
      no_city_retailer = Retailer.new(@attr.merge(:city => ""))
      no_city_retailer.should_not be_valid
    end
    
    it "should require a state if the country is not international" 
    it "should require a country"
    

  end

  describe "Model Associations" do
    
    it "should have a country method" do
      Retailer.new.should respond_to(:country)
    end
    
    it "should have a state method if it's not an international retailer"
    it "shouldn't have a state method if it's international"
    
  end
  
end
