require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Website do
  before(:each) do
    @website = Website.new
  end

  it "should be valid" do
    @website.should be_valid
  end
end
