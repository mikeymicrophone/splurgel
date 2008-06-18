require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tags/edit.html.erb" do
  include TagsHelper
  
  before do
    @tag = mock_model(Tag)
    @tag.stub!(:name).and_return("MyString")
    assigns[:tag] = @tag
  end

  it "should render edit form" do
    render "/tags/edit.html.erb"
    
    response.should have_tag("form[action=#{tag_path(@tag)}][method=post]") do
      with_tag('input#tag_name[name=?]', "tag[name]")
    end
  end
end


