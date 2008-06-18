require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/listings/index.html.erb" do
  include ListingsHelper
  
  before(:each) do
    listing_98 = mock_model(Listing)
    listing_98.should_receive(:list_type).and_return("1")
    listing_98.should_receive(:product_id).and_return("1")
    listing_98.should_receive(:brand_id).and_return("1")
    listing_98.should_receive(:store_id).and_return("1")
    listing_98.should_receive(:user_id).and_return("1")
    listing_98.should_receive(:private).and_return("1")
    listing_99 = mock_model(Listing)
    listing_99.should_receive(:list_type).and_return("1")
    listing_99.should_receive(:product_id).and_return("1")
    listing_99.should_receive(:brand_id).and_return("1")
    listing_99.should_receive(:store_id).and_return("1")
    listing_99.should_receive(:user_id).and_return("1")
    listing_99.should_receive(:private).and_return("1")

    assigns[:listings] = [listing_98, listing_99]
  end

  it "should render list of listings" do
    render "/listings/index.html.erb"
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
  end
end

