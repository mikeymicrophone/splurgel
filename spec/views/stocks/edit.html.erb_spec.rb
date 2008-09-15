require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/stocks/edit.html.erb" do
  include StocksHelper
  
  before(:each) do
    assigns[:stock] = @stock = stub_model(Stock,
      :new_record? => false,
    )
  end

  it "should render edit form" do
    render "/stocks/edit.html.erb"
    
    response.should have_tag("form[action=#{stock_path(@stock)}][method=post]") do
    end
  end
end


