require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/groups/show.html.erb" do
  include GroupsHelper
  
  before(:each) do
    @group = mock_model(Group)
    @group.stub!(:name).and_return("MyString")
    @group.stub!(:administrator_id).and_return("1")
    @group.stub!(:group_type).and_return("1")

    assigns[:group] = @group
  end

  it "should render attributes in <p>" do
    render "/groups/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/1/)
  end
end

