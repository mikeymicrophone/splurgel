require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/websites/new.html.erb" do
  include WebsitesHelper
  
  before(:each) do
    @website = mock_model(Website)
    @website.stub!(:new_record?).and_return(true)
    @website.stub!(:href).and_return("MyString")
    @website.stub!(:name).and_return("MyString")
    @website.stub!(:user_id).and_return("1")
    assigns[:website] = @website
  end

  it "should render new form" do
    render "/websites/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", websites_path) do
      with_tag("input#website_href[name=?]", "website[href]")
      with_tag("input#website_name[name=?]", "website[name]")
    end
  end
end


