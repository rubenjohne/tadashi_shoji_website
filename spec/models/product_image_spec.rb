require 'spec_helper'

describe ProductImage do

  describe "class model associations" do
    
    it "should belong to a style"
    
    it "should have a style attribute" do
      ProductImage.new.should respond_to(:style)
    end
    
  end
  
  describe "model attribute validations" do
    
    before(:each) do
      @attr = { :image_filename => "image.jpg",
                 :image_type => 1,
                 :label => "test image",
                 :style_id => 1  
               }
    end
    
    it "should require image_filename" do
      no_image_filename = ProductImage.new(@attr.merge(:image_filename => ""))
      no_image_filename.should_not be_valid
    end
    
    it "should require image_type" do
      no_image_type = ProductImage.new(@attr.merge(:image_type => ""))
      no_image_type.should_not be_valid
    end
    
    it "should require style" do
      no_image_style = ProductImage.new(@attr.merge(:style_id => nil))
      no_image_style.should_not be_valid
    end
  
    it "should have not an image type of 0" do
      zero_image_type = ProductImage.new(@attr.merge(:image_type => 0))
      zero_image_type.should_not be_valid      
    end
    
    
  end
  
end
