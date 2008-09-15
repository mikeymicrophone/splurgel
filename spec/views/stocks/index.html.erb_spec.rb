require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/stocks/index.html.erb" do
  include StocksHelper
  
  before(:each) do
    assigns[:stocks] = [
      stub_model(Stock,
      ),
      stub_model(Stock,
      )
    ]
  end

  it "should render list of stocks" do
    render "/stocks/index.html.erb"
  end
end

