require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/addresses/edit.html.erb" do
  include AddressesHelper
  
  before do
    @address = mock_model(Address)
    @address.stub!(:latitude).and_return("MyString")
    @address.stub!(:longitude).and_return("MyString")
    @address.stub!(:name).and_return("MyString")
    @address.stub!(:alternate_names).and_return("MyString")
    @address.stub!(:street).and_return("MyString")
    @address.stub!(:street2).and_return("MyString")
    @address.stub!(:city).and_return("MyString")
    @address.stub!(:state).and_return("MyString")
    @address.stub!(:city_id).and_return("1")
    @address.stub!(:state_id).and_return("1")
    @address.stub!(:zip).and_return("1")
    assigns[:address] = @address
  end

  it "should render edit form" do
    render "/addresses/edit.html.erb"
    
    response.should have_tag("form[action=#{address_path(@address)}][method=post]") do
      with_tag('input#address_latitude[name=?]', "address[latitude]")
      with_tag('input#address_longitude[name=?]', "address[longitude]")
      with_tag('input#address_name[name=?]', "address[name]")
      with_tag('input#address_alternate_names[name=?]', "address[alternate_names]")
      with_tag('input#address_street[name=?]', "address[street]")
      with_tag('input#address_street2[name=?]', "address[street2]")
      with_tag('input#address_city[name=?]', "address[city]")
      with_tag('input#address_state[name=?]', "address[state]")
      with_tag('input#address_zip[name=?]', "address[zip]")
    end
  end
end


