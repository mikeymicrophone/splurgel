require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/prices/new.html.erb" do
  include PricesHelper
  
  before(:each) do
    @price = mock_model(Price)
    @price.stub!(:new_record?).and_return(true)
    @price.stub!(:offering_id).and_return("1")
    @price.stub!(:sale).and_return(false)
    @price.stub!(:end_date).and_return(Time.now)
    assigns[:price] = @price
  end

  it "should render new form" do
    render "/prices/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", prices_path) do
      with_tag("input#price_sale[name=?]", "price[sale]")
    end
  end
end


