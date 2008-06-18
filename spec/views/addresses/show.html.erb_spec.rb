require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/addresses/show.html.erb" do
  include AddressesHelper
  
  before(:each) do
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

  it "should render attributes in <p>" do
    render "/addresses/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/1/)
  end
end

