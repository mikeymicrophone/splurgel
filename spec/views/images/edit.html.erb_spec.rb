require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/images/edit.html.erb" do
  include ImagesHelper
  
  before do
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

  it "should render edit form" do
    render "/images/edit.html.erb"
    
    response.should have_tag("form[action=#{image_path(@image)}][method=post]") do
      with_tag('input#image_size[name=?]', "image[size]")
      with_tag('input#image_content_type[name=?]', "image[content_type]")
      with_tag('input#image_filename[name=?]', "image[filename]")
      with_tag('input#image_height[name=?]', "image[height]")
      with_tag('input#image_width[name=?]', "image[width]")
      with_tag('input#image_thumbnail[name=?]', "image[thumbnail]")
    end
  end
end


