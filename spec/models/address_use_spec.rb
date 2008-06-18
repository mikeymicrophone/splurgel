require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AddressUse do
  before(:each) do
    @address_use = AddressUse.new
  end

  it "should be valid" do
    @address_use.should be_valid
  end
end
