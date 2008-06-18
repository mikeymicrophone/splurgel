require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/address_uses/edit.html.erb" do
  include AddressUsesHelper
  
  before do
    @address_use = mock_model(AddressUse)
    @address_use.stub!(:target_type).and_return("MyString")
    @address_use.stub!(:target_id).and_return("1")
    @address_use.stub!(:address_id).and_return("1")
    assigns[:address_use] = @address_use
  end

  it "should render edit form" do
    render "/address_uses/edit.html.erb"
    
    response.should have_tag("form[action=#{address_use_path(@address_use)}][method=post]") do
      with_tag('input#address_use_target_type[name=?]', "address_use[target_type]")
    end
  end
end


