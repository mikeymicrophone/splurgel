require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/stocks/new.html.erb" do
  include StocksHelper
  
  before(:each) do
    assigns[:stock] = stub_model(Stock,
      :new_record? => true,
    )
  end

  it "should render new form" do
    render "/stocks/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", stocks_path) do
    end
  end
end


