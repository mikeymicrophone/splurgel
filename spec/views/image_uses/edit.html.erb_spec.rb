require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/image_uses/edit.html.erb" do
  include ImageUsesHelper
  
  before do
    @image_use = mock_model(ImageUse)
    @image_use.stub!(:image_id).and_return("1")
    @image_use.stub!(:target_type).and_return("MyString")
    @image_use.stub!(:target_id).and_return("1")
    assigns[:image_use] = @image_use
  end

  it "should render edit form" do
    render "/image_uses/edit.html.erb"
    
    response.should have_tag("form[action=#{image_use_path(@image_use)}][method=post]") do
      with_tag('input#image_use_target_type[name=?]', "image_use[target_type]")
    end
  end
end


