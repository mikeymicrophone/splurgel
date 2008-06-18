require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/network_memberships/index.html.erb" do
  include NetworkMembershipsHelper
  
  before(:each) do
    network_membership_98 = mock_model(NetworkMembership)
    network_membership_98.should_receive(:user_id).and_return("1")
    network_membership_98.should_receive(:network_id).and_return("1")
    network_membership_99 = mock_model(NetworkMembership)
    network_membership_99.should_receive(:user_id).and_return("1")
    network_membership_99.should_receive(:network_id).and_return("1")

    assigns[:network_memberships] = [network_membership_98, network_membership_99]
  end

  it "should render list of network_memberships" do
    render "/network_memberships/index.html.erb"
  end
end

