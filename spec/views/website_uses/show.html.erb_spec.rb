require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/website_uses/show.html.erb" do
  include WebsiteUsesHelper
  
  before(:each) do
    @website_use = mock_model(WebsiteUse)
    @website_use.stub!(:target_type).and_return("MyString")
    @website_use.stub!(:target_id).and_return("1")
    @website_use.stub!(:website_id).and_return("1")

    assigns[:website_use] = @website_use
  end

  it "should render attributes in <p>" do
    render "/website_uses/show.html.erb"
    response.should have_text(/MyString/)
  end
end

