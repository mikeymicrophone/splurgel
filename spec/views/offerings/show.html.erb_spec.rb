require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/offerings/show.html.erb" do
  include OfferingsHelper
  
  before(:each) do
    @offering = mock_model(Offering)
    @offering.stub!(:product_id).and_return("1")
    @offering.stub!(:location_id).and_return("1")
    @offering.stub!(:stock).and_return("MyString")

    assigns[:offering] = @offering
  end

  it "should render attributes in <p>" do
    render "/offerings/show.html.erb"
    response.should have_text(/MyString/)
  end
end

