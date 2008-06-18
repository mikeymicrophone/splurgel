require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/prices/edit.html.erb" do
  include PricesHelper
  
  before do
    @price = mock_model(Price)
    @price.stub!(:offering_id).and_return("1")
    @price.stub!(:sale).and_return(false)
    @price.stub!(:end_date).and_return(Time.now)
    assigns[:price] = @price
  end

  it "should render edit form" do
    render "/prices/edit.html.erb"
    
    response.should have_tag("form[action=#{price_path(@price)}][method=post]") do
      with_tag('input#price_sale[name=?]', "price[sale]")
    end
  end
end


