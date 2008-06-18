require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/address_uses/index.html.erb" do
  include AddressUsesHelper
  
  before(:each) do
    address_use_98 = mock_model(AddressUse)
    address_use_98.should_receive(:target_type).and_return("MyString")
    address_use_98.should_receive(:target_id).and_return("1")
    address_use_98.should_receive(:address_id).and_return("1")
    address_use_99 = mock_model(AddressUse)
    address_use_99.should_receive(:target_type).and_return("MyString")
    address_use_99.should_receive(:target_id).and_return("1")
    address_use_99.should_receive(:address_id).and_return("1")

    assigns[:address_uses] = [address_use_98, address_use_99]
  end

  it "should render list of address_uses" do
    render "/address_uses/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

