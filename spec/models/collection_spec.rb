require 'spec_helper'

describe Collection do

  describe "model associations" do
    
    it "should have styles attribute" do
      Collection.new.should respond_to(:styles)
    end
    
  end
  
end
