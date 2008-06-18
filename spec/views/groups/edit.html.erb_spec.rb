require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/groups/edit.html.erb" do
  include GroupsHelper
  
  before do
    @group = mock_model(Group)
    @group.stub!(:name).and_return("MyString")
    @group.stub!(:administrator_id).and_return("1")
    @group.stub!(:group_type).and_return("1")
    assigns[:group] = @group
  end

  it "should render edit form" do
    render "/groups/edit.html.erb"
    
    response.should have_tag("form[action=#{group_path(@group)}][method=post]") do
      with_tag('input#group_name[name=?]', "group[name]")
      with_tag('input#group_group_type[name=?]', "group[group_type]")
    end
  end
end


