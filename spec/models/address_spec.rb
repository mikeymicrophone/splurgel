require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Address do
  before(:each) do
    @address = Address.new
  end

  it "should be valid" do
    @address.should be_valid
  end
end
