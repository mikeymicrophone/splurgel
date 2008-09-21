require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/blogs/index.html.erb" do
  include BlogsHelper
  
  before(:each) do
    assigns[:blogs] = [
      stub_model(Blog,
        :name => "value for name",
      ),
      stub_model(Blog,
        :name => "value for name",
      )
    ]
  end

  it "should render list of blogs" do
    render "/blogs/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
  end
end

