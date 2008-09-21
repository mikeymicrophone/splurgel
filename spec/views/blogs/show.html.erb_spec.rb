require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/blogs/show.html.erb" do
  include BlogsHelper
  
  before(:each) do
    assigns[:blog] = @blog = stub_model(Blog,
      :name => "value for name",
    )
  end

  it "should render attributes in <p>" do
    render "/blogs/show.html.erb"
    response.should have_text(/value\ for\ name/)
  end
end

