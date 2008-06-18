require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tags/index.html.erb" do
  include TagsHelper
  
  before(:each) do
    tag_98 = mock_model(Tag)
    tag_98.should_receive(:name).and_return("MyString")
    tag_99 = mock_model(Tag)
    tag_99.should_receive(:name).and_return("MyString")

    assigns[:tags] = [tag_98, tag_99]
  end

  it "should render list of tags" do
    render "/tags/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

