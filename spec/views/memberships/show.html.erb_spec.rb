require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/memberships/show.html.erb" do
  include MembershipsHelper
  
  before(:each) do
    @membership = mock_model(Membership)
    @membership.stub!(:group_id).and_return("1")
    @membership.stub!(:user_id).and_return("1")

    assigns[:membership] = @membership
  end

  it "should render attributes in <p>" do
    render "/memberships/show.html.erb"
  end
end

