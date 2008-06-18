require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Price do
  before(:each) do
    @price = Price.new
  end

  it "should be valid" do
    @price.should be_valid
  end
end
