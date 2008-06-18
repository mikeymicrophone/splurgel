require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/websites/index.html.erb" do
  include WebsitesHelper
  
  before(:each) do
    website_98 = mock_model(Website)
    website_98.should_receive(:href).and_return("MyString")
    website_98.should_receive(:name).and_return("MyString")
    website_98.should_receive(:user_id).and_return("1")
    website_99 = mock_model(Website)
    website_99.should_receive(:href).and_return("MyString")
    website_99.should_receive(:name).and_return("MyString")
    website_99.should_receive(:user_id).and_return("1")

    assigns[:websites] = [website_98, website_99]
  end

  it "should render list of websites" do
    render "/websites/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

