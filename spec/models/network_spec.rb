require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Network do
  before(:each) do
    @network = Network.new
  end

  it "should be valid" do
    @network.should be_valid
  end
end
