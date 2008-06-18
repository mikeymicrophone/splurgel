require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/image_uses/show.html.erb" do
  include ImageUsesHelper
  
  before(:each) do
    @image_use = mock_model(ImageUse)
    @image_use.stub!(:image_id).and_return("1")
    @image_use.stub!(:target_type).and_return("MyString")
    @image_use.stub!(:target_id).and_return("1")

    assigns[:image_use] = @image_use
  end

  it "should render attributes in <p>" do
    render "/image_uses/show.html.erb"
    response.should have_text(/MyString/)
  end
end

