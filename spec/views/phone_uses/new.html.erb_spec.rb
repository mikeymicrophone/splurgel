require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/phone_uses/new.html.erb" do
  include PhoneUsesHelper
  
  before(:each) do
    @phone_use = mock_model(PhoneUse)
    @phone_use.stub!(:new_record?).and_return(true)
    assigns[:phone_use] = @phone_use
  end

  it "should render new form" do
    render "/phone_uses/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", phone_uses_path) do
    end
  end
end


