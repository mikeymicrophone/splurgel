require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tags/show.html.erb" do
  include TagsHelper
  
  before(:each) do
    @tag = mock_model(Tag)
    @tag.stub!(:name).and_return("MyString")

    assigns[:tag] = @tag
  end

  it "should render attributes in <p>" do
    render "/tags/show.html.erb"
    response.should have_text(/MyString/)
  end
end

