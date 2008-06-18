require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/offerings/index.html.erb" do
  include OfferingsHelper
  
  before(:each) do
    offering_98 = mock_model(Offering)
    offering_98.should_receive(:product_id).and_return("1")
    offering_98.should_receive(:location_id).and_return("1")
    offering_98.should_receive(:stock).and_return("MyString")
    offering_99 = mock_model(Offering)
    offering_99.should_receive(:product_id).and_return("1")
    offering_99.should_receive(:location_id).and_return("1")
    offering_99.should_receive(:stock).and_return("MyString")

    assigns[:offerings] = [offering_98, offering_99]
  end

  it "should render list of offerings" do
    render "/offerings/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

