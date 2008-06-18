require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/memberships/new.html.erb" do
  include MembershipsHelper
  
  before(:each) do
    @membership = mock_model(Membership)
    @membership.stub!(:new_record?).and_return(true)
    @membership.stub!(:group_id).and_return("1")
    @membership.stub!(:user_id).and_return("1")
    assigns[:membership] = @membership
  end

  it "should render new form" do
    render "/memberships/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", memberships_path) do
    end
  end
end


