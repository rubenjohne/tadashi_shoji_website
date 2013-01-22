require 'spec_helper'

describe Style do
  
  describe "class model associations" do
  
    it "should have a color attribute" do
      style = Style.new
      style.should respond_to(:color)
    end
  
    it "should have a size attribute" do
      style = Style.new
      style.should respond_to(:size)
    end
    
    it "should have a collection attribute" do
      Style.new.should respond_to(:collection)
    end
    
    it "should have a product images attribute" do
      Style.new.should respond_to(:product_images)
    end
    
  end
  
  describe "model attribute validations" do
    
    before(:each) do
      @attr = {:name => "EI8575L",
               :price => 388,
               :description => "chiffon beaded gown",
               :collection_id => 1,
               :color_id => 1,
               :size_id => 1}
    end
    
    it "should require a style name" do
      no_name_style = Style.new(@attr.merge(:name => ""))
      no_name_style.should_not be_valid
    end
    
    it "should require a price" do
      no_price_style = Style.new(@attr.merge(:price => ""))
      no_price_style.should_not be_valid
    end
    
    it "should require a description" do
      no_description_style = Style.new(@attr.merge(:description => ""))
      no_description_style.should_not be_valid
    end

    it "should require a collection" do
      no_collection_style = Style.new(@attr.merge(:collection_id => ""))
      no_collection_style.should_not be_valid
    end
    
    it "should require a color" do
      no_color_style = Style.new(@attr.merge(:color_id => ""))
      no_color_style.should_not be_valid
    end
    
    it "should require a size" do
      no_size_style = Style.new(@attr.merge(:size_id => ""))
      no_size_style.should_not be_valid
    end
      
  end

  
end
