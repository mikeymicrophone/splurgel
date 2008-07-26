require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Authorization do
  before(:each) do
    @authorization = Authorization.new
  end

  it "should be valid" do
    @authorization.should be_valid
  end
end
