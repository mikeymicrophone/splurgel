require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/image_uses/new.html.erb" do
  include ImageUsesHelper
  
  before(:each) do
    @image_use = mock_model(ImageUse)
    @image_use.stub!(:new_record?).and_return(true)
    @image_use.stub!(:image_id).and_return("1")
    @image_use.stub!(:target_type).and_return("MyString")
    @image_use.stub!(:target_id).and_return("1")
    assigns[:image_use] = @image_use
  end

  it "should render new form" do
    render "/image_uses/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", image_uses_path) do
      with_tag("input#image_use_target_type[name=?]", "image_use[target_type]")
    end
  end
end


