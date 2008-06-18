require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/images/index.html.erb" do
  include ImagesHelper
  
  before(:each) do
    image_98 = mock_model(Image)
    image_98.should_receive(:size).and_return("1")
    image_98.should_receive(:content_type).and_return("MyString")
    image_98.should_receive(:filename).and_return("MyString")
    image_98.should_receive(:height).and_return("1")
    image_98.should_receive(:width).and_return("1")
    image_98.should_receive(:parent_id).and_return("1")
    image_98.should_receive(:thumbnail).and_return("MyString")
    image_99 = mock_model(Image)
    image_99.should_receive(:size).and_return("1")
    image_99.should_receive(:content_type).and_return("MyString")
    image_99.should_receive(:filename).and_return("MyString")
    image_99.should_receive(:height).and_return("1")
    image_99.should_receive(:width).and_return("1")
    image_99.should_receive(:parent_id).and_return("1")
    image_99.should_receive(:thumbnail).and_return("MyString")

    assigns[:images] = [image_98, image_99]
  end

  it "should render list of images" do
    render "/images/index.html.erb"
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

