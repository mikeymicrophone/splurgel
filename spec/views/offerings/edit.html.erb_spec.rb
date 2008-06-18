require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/offerings/edit.html.erb" do
  include OfferingsHelper
  
  before do
    @offering = mock_model(Offering)
    @offering.stub!(:product_id).and_return("1")
    @offering.stub!(:location_id).and_return("1")
    @offering.stub!(:stock).and_return("MyString")
    assigns[:offering] = @offering
  end

  it "should render edit form" do
    render "/offerings/edit.html.erb"
    
    response.should have_tag("form[action=#{offering_path(@offering)}][method=post]") do
      with_tag('input#offering_stock[name=?]', "offering[stock]")
    end
  end
end


