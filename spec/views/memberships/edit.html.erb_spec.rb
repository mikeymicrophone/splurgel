require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/memberships/edit.html.erb" do
  include MembershipsHelper
  
  before do
    @membership = mock_model(Membership)
    @membership.stub!(:group_id).and_return("1")
    @membership.stub!(:user_id).and_return("1")
    assigns[:membership] = @membership
  end

  it "should render edit form" do
    render "/memberships/edit.html.erb"
    
    response.should have_tag("form[action=#{membership_path(@membership)}][method=post]") do
    end
  end
end


