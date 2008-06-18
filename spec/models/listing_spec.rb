require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Listing do
  before(:each) do
    @listing = Listing.new
  end

  it "should be valid" do
    @listing.should be_valid
  end
end
