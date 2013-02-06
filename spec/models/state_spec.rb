require 'spec_helper'

describe State do
  
  describe "model validations" do 
    before(:each) do
      @attr = {
        :state_code => "CA",
        :state => "California"
      }
    end
    
    it "should require state code" do
      no_state_code = State.new(@attr.merge(:state_code => ""))
      no_state_code.should_not be_valid 
    end
    
    it "should only be 2 lengths" do
      long_state_code = State.new(@attr.merge(:state_code => "CAL"))
      long_state_code.should_not be_valid 
    end
    
  end
  
  
  describe "model associations" do
    
    it "should have a country method" do
      State.new.should respond_to(:country)
    end
    
    it "should have retailers method" do
      State.new.should respond_to(:retailers)
    end
    
  end
  
end
