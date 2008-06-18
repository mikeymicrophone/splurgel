require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/website_uses/edit.html.erb" do
  include WebsiteUsesHelper
  
  before do
    @website_use = mock_model(WebsiteUse)
    @website_use.stub!(:target_type).and_return("MyString")
    @website_use.stub!(:target_id).and_return("1")
    @website_use.stub!(:website_id).and_return("1")
    assigns[:website_use] = @website_use
  end

  it "should render edit form" do
    render "/website_uses/edit.html.erb"
    
    response.should have_tag("form[action=#{website_use_path(@website_use)}][method=post]") do
      with_tag('input#website_use_target_type[name=?]', "website_use[target_type]")
    end
  end
end


