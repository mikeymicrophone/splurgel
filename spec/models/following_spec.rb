require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Following do
  before(:each) do
    @following = Following.new
  end

  it "should be valid" do
    @following.should be_valid
  end
end
