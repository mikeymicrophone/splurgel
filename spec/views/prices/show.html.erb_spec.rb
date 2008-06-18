require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/prices/show.html.erb" do
  include PricesHelper
  
  before(:each) do
    @price = mock_model(Price)
    @price.stub!(:offering_id).and_return("1")
    @price.stub!(:sale).and_return(false)
    @price.stub!(:end_date).and_return(Time.now)

    assigns[:price] = @price
  end

  it "should render attributes in <p>" do
    render "/prices/show.html.erb"
    response.should have_text(/als/)
  end
end

