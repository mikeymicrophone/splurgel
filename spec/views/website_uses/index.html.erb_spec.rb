require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/website_uses/index.html.erb" do
  include WebsiteUsesHelper
  
  before(:each) do
    website_use_98 = mock_model(WebsiteUse)
    website_use_98.should_receive(:target_type).and_return("MyString")
    website_use_98.should_receive(:target_id).and_return("1")
    website_use_98.should_receive(:website_id).and_return("1")
    website_use_99 = mock_model(WebsiteUse)
    website_use_99.should_receive(:target_type).and_return("MyString")
    website_use_99.should_receive(:target_id).and_return("1")
    website_use_99.should_receive(:website_id).and_return("1")

    assigns[:website_uses] = [website_use_98, website_use_99]
  end

  it "should render list of website_uses" do
    render "/website_uses/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

