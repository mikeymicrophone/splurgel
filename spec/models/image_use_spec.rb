require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ImageUse do
  before(:each) do
    @image_use = ImageUse.new
  end

  it "should be valid" do
    @image_use.should be_valid
  end
end
