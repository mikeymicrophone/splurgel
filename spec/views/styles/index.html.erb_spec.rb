require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/styles/index.html.erb" do
  include StylesHelper
  
  before(:each) do
    assigns[:styles] = [
      stub_model(Style,
        :size => "value for size",
        :traits => "value for traits",
      ),
      stub_model(Style,
        :size => "value for size",
        :traits => "value for traits",
      )
    ]
  end

  it "should render list of styles" do
    render "/styles/index.html.erb"
    response.should have_tag("tr>td", "value for size", 2)
    response.should have_tag("tr>td", "value for traits", 2)
  end
end

