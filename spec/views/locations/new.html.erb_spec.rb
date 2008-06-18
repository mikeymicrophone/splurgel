require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/locations/new.html.erb" do
  include LocationsHelper
  
  before(:each) do
    @location = mock_model(Location)
    @location.stub!(:new_record?).and_return(true)
    @location.stub!(:phone).and_return("MyString")
    @location.stub!(:store_id).and_return("1")
    @location.stub!(:schedule_id).and_return("1")
    @location.stub!(:address_id).and_return("1")
    assigns[:location] = @location
  end

  it "should render new form" do
    render "/locations/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", locations_path) do
      with_tag("input#location_phone[name=?]", "location[phone]")
    end
  end
end


