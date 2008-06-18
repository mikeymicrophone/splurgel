require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/offerings/new.html.erb" do
  include OfferingsHelper
  
  before(:each) do
    @offering = mock_model(Offering)
    @offering.stub!(:new_record?).and_return(true)
    @offering.stub!(:product_id).and_return("1")
    @offering.stub!(:location_id).and_return("1")
    @offering.stub!(:stock).and_return("MyString")
    assigns[:offering] = @offering
  end

  it "should render new form" do
    render "/offerings/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", offerings_path) do
      with_tag("input#offering_stock[name=?]", "offering[stock]")
    end
  end
end


