require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Offering do
  before(:each) do
    @offering = Offering.new
  end

  it "should be valid" do
    @offering.should be_valid
  end
end
