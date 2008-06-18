require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Brand do
  before(:each) do
    @brand = Brand.new
  end

  it "should be valid" do
    @brand.should be_valid
  end
  
  it "should be able to have images" do
    @image = Image.new
    @brand.images << @image
    @brand.images.should_not be_nil
  end
end
