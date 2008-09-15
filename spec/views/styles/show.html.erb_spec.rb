require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/styles/show.html.erb" do
  include StylesHelper
  
  before(:each) do
    assigns[:style] = @style = stub_model(Style,
      :size => "value for size",
      :traits => "value for traits",
    )
  end

  it "should render attributes in <p>" do
    render "/styles/show.html.erb"
    response.should have_text(/value\ for\ size/)
    response.should have_text(/value\ for\ traits/)
  end
end

