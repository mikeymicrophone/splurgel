require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/locations/index.html.erb" do
  include LocationsHelper
  
  before(:each) do
    location_98 = mock_model(Location)
    location_98.should_receive(:phone).and_return("MyString")
    location_98.should_receive(:store_id).and_return("1")
    location_98.should_receive(:schedule_id).and_return("1")
    location_98.should_receive(:address_id).and_return("1")
    location_99 = mock_model(Location)
    location_99.should_receive(:phone).and_return("MyString")
    location_99.should_receive(:store_id).and_return("1")
    location_99.should_receive(:schedule_id).and_return("1")
    location_99.should_receive(:address_id).and_return("1")

    assigns[:locations] = [location_98, location_99]
  end

  it "should render list of locations" do
    render "/locations/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

