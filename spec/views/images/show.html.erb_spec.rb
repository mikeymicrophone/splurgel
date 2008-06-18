require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/images/show.html.erb" do
  include ImagesHelper
  
  before(:each) do
    @image = mock_model(Image)
    @image.stub!(:size).and_return("1")
    @image.stub!(:content_type).and_return("MyString")
    @image.stub!(:filename).and_return("MyString")
    @image.stub!(:height).and_return("1")
    @image.stub!(:width).and_return("1")
    @image.stub!(:parent_id).and_return("1")
    @image.stub!(:thumbnail).and_return("MyString")

    assigns[:image] = @image
  end

  it "should render attributes in <p>" do
    render "/images/show.html.erb"
    response.should have_text(/1/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/MyString/)
  end
end

