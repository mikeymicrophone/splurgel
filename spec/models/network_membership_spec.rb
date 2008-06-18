require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NetworkMembership do
  before(:each) do
    @network_membership = NetworkMembership.new
  end

  it "should be valid" do
    @network_membership.should be_valid
  end
end
