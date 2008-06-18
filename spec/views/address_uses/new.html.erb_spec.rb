require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/address_uses/new.html.erb" do
  include AddressUsesHelper
  
  before(:each) do
    @address_use = mock_model(AddressUse)
    @address_use.stub!(:new_record?).and_return(true)
    @address_use.stub!(:target_type).and_return("MyString")
    @address_use.stub!(:target_id).and_return("1")
    @address_use.stub!(:address_id).and_return("1")
    assigns[:address_use] = @address_use
  end

  it "should render new form" do
    render "/address_uses/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", address_uses_path) do
      with_tag("input#address_use_target_type[name=?]", "address_use[target_type]")
    end
  end
end


