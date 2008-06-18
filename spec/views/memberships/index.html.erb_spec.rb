require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/memberships/index.html.erb" do
  include MembershipsHelper
  
  before(:each) do
    membership_98 = mock_model(Membership)
    membership_98.should_receive(:group_id).and_return("1")
    membership_98.should_receive(:user_id).and_return("1")
    membership_99 = mock_model(Membership)
    membership_99.should_receive(:group_id).and_return("1")
    membership_99.should_receive(:user_id).and_return("1")

    assigns[:memberships] = [membership_98, membership_99]
  end

  it "should render list of memberships" do
    render "/memberships/index.html.erb"
  end
end

