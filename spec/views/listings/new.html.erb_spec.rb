require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/listings/new.html.erb" do
  include ListingsHelper
  
  before(:each) do
    @listing = mock_model(Listing)
    @listing.stub!(:new_record?).and_return(true)
    @listing.stub!(:list_type).and_return("1")
    @listing.stub!(:product_id).and_return("1")
    @listing.stub!(:brand_id).and_return("1")
    @listing.stub!(:store_id).and_return("1")
    @listing.stub!(:user_id).and_return("1")
    @listing.stub!(:private).and_return("1")
    assigns[:listing] = @listing
  end

  it "should render new form" do
    render "/listings/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", listings_path) do
      with_tag("input#listing_list_type[name=?]", "listing[list_type]")
      with_tag("input#listing_private[name=?]", "listing[private]")
    end
  end
end


