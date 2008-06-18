require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/groups/index.html.erb" do
  include GroupsHelper
  
  before(:each) do
    group_98 = mock_model(Group)
    group_98.should_receive(:name).and_return("MyString")
    group_98.should_receive(:administrator_id).and_return("1")
    group_98.should_receive(:group_type).and_return("1")
    group_99 = mock_model(Group)
    group_99.should_receive(:name).and_return("MyString")
    group_99.should_receive(:administrator_id).and_return("1")
    group_99.should_receive(:group_type).and_return("1")

    assigns[:groups] = [group_98, group_99]
  end

  it "should render list of groups" do
    render "/groups/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "1", 2)
  end
end

