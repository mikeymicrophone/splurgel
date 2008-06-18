require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/locations/edit.html.erb" do
  include LocationsHelper
  
  before do
    @location = mock_model(Location)
    @location.stub!(:phone).and_return("MyString")
    @location.stub!(:store_id).and_return("1")
    @location.stub!(:schedule_id).and_return("1")
    @location.stub!(:address_id).and_return("1")
    assigns[:location] = @location
  end

  it "should render edit form" do
    render "/locations/edit.html.erb"
    
    response.should have_tag("form[action=#{location_path(@location)}][method=post]") do
      with_tag('input#location_phone[name=?]', "location[phone]")
    end
  end
end


