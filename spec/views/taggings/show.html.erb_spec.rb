require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/taggings/show.html.erb" do
  include TaggingsHelper
  
  before(:each) do
    @tagging = mock_model(Tagging)
    @tagging.stub!(:tag_id).and_return("1")
    @tagging.stub!(:target_type).and_return("MyString")
    @tagging.stub!(:target_id).and_return("1")

    assigns[:tagging] = @tagging
  end

  it "should render attributes in <p>" do
    render "/taggings/show.html.erb"
    response.should have_text(/MyString/)
  end
end

