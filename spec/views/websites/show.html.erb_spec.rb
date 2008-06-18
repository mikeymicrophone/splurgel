require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/websites/show.html.erb" do
  include WebsitesHelper
  
  before(:each) do
    @website = mock_model(Website)
    @website.stub!(:href).and_return("MyString")
    @website.stub!(:name).and_return("MyString")
    @website.stub!(:user_id).and_return("1")

    assigns[:website] = @website
  end

  it "should render attributes in <p>" do
    render "/websites/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

