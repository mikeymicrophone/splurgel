require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/websites/edit.html.erb" do
  include WebsitesHelper
  
  before do
    @website = mock_model(Website)
    @website.stub!(:href).and_return("MyString")
    @website.stub!(:name).and_return("MyString")
    @website.stub!(:user_id).and_return("1")
    assigns[:website] = @website
  end

  it "should render edit form" do
    render "/websites/edit.html.erb"
    
    response.should have_tag("form[action=#{website_path(@website)}][method=post]") do
      with_tag('input#website_href[name=?]', "website[href]")
      with_tag('input#website_name[name=?]', "website[name]")
    end
  end
end


