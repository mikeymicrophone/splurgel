require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/network_memberships/new.html.erb" do
  include NetworkMembershipsHelper
  
  before(:each) do
    @network_membership = mock_model(NetworkMembership)
    @network_membership.stub!(:new_record?).and_return(true)
    @network_membership.stub!(:user_id).and_return("1")
    @network_membership.stub!(:network_id).and_return("1")
    assigns[:network_membership] = @network_membership
  end

  it "should render new form" do
    render "/network_memberships/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", network_memberships_path) do
    end
  end
end


