require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/image_uses/index.html.erb" do
  include ImageUsesHelper
  
  before(:each) do
    image_use_98 = mock_model(ImageUse)
    image_use_98.should_receive(:image_id).and_return("1")
    image_use_98.should_receive(:target_type).and_return("MyString")
    image_use_98.should_receive(:target_id).and_return("1")
    image_use_99 = mock_model(ImageUse)
    image_use_99.should_receive(:image_id).and_return("1")
    image_use_99.should_receive(:target_type).and_return("MyString")
    image_use_99.should_receive(:target_id).and_return("1")

    assigns[:image_uses] = [image_use_98, image_use_99]
  end

  it "should render list of image_uses" do
    render "/image_uses/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

