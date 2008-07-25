require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PhoneUse do
  before(:each) do
    @phone_use = PhoneUse.new
  end

  it "should be valid" do
    @phone_use.should be_valid
  end
end
