require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/addresses/index.html.erb" do
  include AddressesHelper
  
  before(:each) do
    address_98 = mock_model(Address)
    address_98.should_receive(:latitude).and_return("MyString")
    address_98.should_receive(:longitude).and_return("MyString")
    address_98.should_receive(:name).and_return("MyString")
    address_98.should_receive(:alternate_names).and_return("MyString")
    address_98.should_receive(:street).and_return("MyString")
    address_98.should_receive(:street2).and_return("MyString")
    address_98.should_receive(:city).and_return("MyString")
    address_98.should_receive(:state).and_return("MyString")
    address_98.should_receive(:city_id).and_return("1")
    address_98.should_receive(:state_id).and_return("1")
    address_98.should_receive(:zip).and_return("1")
    address_99 = mock_model(Address)
    address_99.should_receive(:latitude).and_return("MyString")
    address_99.should_receive(:longitude).and_return("MyString")
    address_99.should_receive(:name).and_return("MyString")
    address_99.should_receive(:alternate_names).and_return("MyString")
    address_99.should_receive(:street).and_return("MyString")
    address_99.should_receive(:street2).and_return("MyString")
    address_99.should_receive(:city).and_return("MyString")
    address_99.should_receive(:state).and_return("MyString")
    address_99.should_receive(:city_id).and_return("1")
    address_99.should_receive(:state_id).and_return("1")
    address_99.should_receive(:zip).and_return("1")

    assigns[:addresses] = [address_98, address_99]
  end

  it "should render list of addresses" do
    render "/addresses/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "1", 2)
  end
end

