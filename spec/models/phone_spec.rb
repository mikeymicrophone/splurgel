require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Phone do
  before(:each) do
    @phone = Phone.new
  end

  it "should be valid" do
    @phone.should be_valid
  end
end
