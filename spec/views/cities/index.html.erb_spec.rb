require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/cities/index.html.erb" do
  include CitiesHelper
  
  before(:each) do
    city_98 = mock_model(City)
    city_98.should_receive(:name).and_return("MyString")
    city_98.should_receive(:state_id).and_return("1")
    city_99 = mock_model(City)
    city_99.should_receive(:name).and_return("MyString")
    city_99.should_receive(:state_id).and_return("1")

    assigns[:cities] = [city_98, city_99]
  end

  it "should render list of cities" do
    render "/cities/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

