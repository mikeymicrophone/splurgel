require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/listings/edit.html.erb" do
  include ListingsHelper
  
  before do
    @listing = mock_model(Listing)
    @listing.stub!(:list_type).and_return("1")
    @listing.stub!(:product_id).and_return("1")
    @listing.stub!(:brand_id).and_return("1")
    @listing.stub!(:store_id).and_return("1")
    @listing.stub!(:user_id).and_return("1")
    @listing.stub!(:private).and_return("1")
    assigns[:listing] = @listing
  end

  it "should render edit form" do
    render "/listings/edit.html.erb"
    
    response.should have_tag("form[action=#{listing_path(@listing)}][method=post]") do
      with_tag('input#listing_list_type[name=?]', "listing[list_type]")
      with_tag('input#listing_private[name=?]', "listing[private]")
    end
  end
end


