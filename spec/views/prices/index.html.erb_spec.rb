require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/prices/index.html.erb" do
  include PricesHelper
  
  before(:each) do
    price_98 = mock_model(Price)
    price_98.should_receive(:offering_id).and_return("1")
    price_98.should_receive(:sale).and_return(false)
    price_98.should_receive(:end_date).and_return(Time.now)
    price_99 = mock_model(Price)
    price_99.should_receive(:offering_id).and_return("1")
    price_99.should_receive(:sale).and_return(false)
    price_99.should_receive(:end_date).and_return(Time.now)

    assigns[:prices] = [price_98, price_99]
  end

  it "should render list of prices" do
    render "/prices/index.html.erb"
    response.should have_tag("tr>td", false, 2)
  end
end

