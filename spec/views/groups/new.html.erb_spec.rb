require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/groups/new.html.erb" do
  include GroupsHelper
  
  before(:each) do
    @group = mock_model(Group)
    @group.stub!(:new_record?).and_return(true)
    @group.stub!(:name).and_return("MyString")
    @group.stub!(:administrator_id).and_return("1")
    @group.stub!(:group_type).and_return("1")
    assigns[:group] = @group
  end

  it "should render new form" do
    render "/groups/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", groups_path) do
      with_tag("input#group_name[name=?]", "group[name]")
      with_tag("input#group_group_type[name=?]", "group[group_type]")
    end
  end
end


