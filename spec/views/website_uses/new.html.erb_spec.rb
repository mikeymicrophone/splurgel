require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/website_uses/new.html.erb" do
  include WebsiteUsesHelper
  
  before(:each) do
    @website_use = mock_model(WebsiteUse)
    @website_use.stub!(:new_record?).and_return(true)
    @website_use.stub!(:target_type).and_return("MyString")
    @website_use.stub!(:target_id).and_return("1")
    @website_use.stub!(:website_id).and_return("1")
    assigns[:website_use] = @website_use
  end

  it "should render new form" do
    render "/website_uses/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", website_uses_path) do
      with_tag("input#website_use_target_type[name=?]", "website_use[target_type]")
    end
  end
end


