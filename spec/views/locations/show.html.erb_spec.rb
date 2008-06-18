require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/locations/show.html.erb" do
  include LocationsHelper
  
  before(:each) do
    @location = mock_model(Location)
    @location.stub!(:phone).and_return("MyString")
    @location.stub!(:store_id).and_return("1")
    @location.stub!(:schedule_id).and_return("1")
    @location.stub!(:address_id).and_return("1")

    assigns[:location] = @location
  end

  it "should render attributes in <p>" do
    render "/locations/show.html.erb"
    response.should have_text(/MyString/)
  end
end

