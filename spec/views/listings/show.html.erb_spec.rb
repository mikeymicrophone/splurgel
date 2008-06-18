require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/listings/show.html.erb" do
  include ListingsHelper
  
  before(:each) do
    @listing = mock_model(Listing)
    @listing.stub!(:list_type).and_return("1")
    @listing.stub!(:product_id).and_return("1")
    @listing.stub!(:brand_id).and_return("1")
    @listing.stub!(:store_id).and_return("1")
    @listing.stub!(:user_id).and_return("1")
    @listing.stub!(:private).and_return("1")

    assigns[:listing] = @listing
  end

  it "should render attributes in <p>" do
    render "/listings/show.html.erb"
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end

