require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/network_memberships/edit.html.erb" do
  include NetworkMembershipsHelper
  
  before do
    @network_membership = mock_model(NetworkMembership)
    @network_membership.stub!(:user_id).and_return("1")
    @network_membership.stub!(:network_id).and_return("1")
    assigns[:network_membership] = @network_membership
  end

  it "should render edit form" do
    render "/network_memberships/edit.html.erb"
    
    response.should have_tag("form[action=#{network_membership_path(@network_membership)}][method=post]") do
    end
  end
end


