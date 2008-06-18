require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/address_uses/show.html.erb" do
  include AddressUsesHelper
  
  before(:each) do
    @address_use = mock_model(AddressUse)
    @address_use.stub!(:target_type).and_return("MyString")
    @address_use.stub!(:target_id).and_return("1")
    @address_use.stub!(:address_id).and_return("1")

    assigns[:address_use] = @address_use
  end

  it "should render attributes in <p>" do
    render "/address_uses/show.html.erb"
    response.should have_text(/MyString/)
  end
end

