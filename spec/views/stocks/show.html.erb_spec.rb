require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/stocks/show.html.erb" do
  include StocksHelper
  
  before(:each) do
    assigns[:stock] = @stock = stub_model(Stock,
    )
  end

  it "should render attributes in <p>" do
    render "/stocks/show.html.erb"
  end
end

