require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/phone_uses/index.html.erb" do
  include PhoneUsesHelper
  
  before(:each) do
    phone_use_98 = mock_model(PhoneUse)
    phone_use_99 = mock_model(PhoneUse)

    assigns[:phone_uses] = [phone_use_98, phone_use_99]
  end

  it "should render list of phone_uses" do
    render "/phone_uses/index.html.erb"
  end
end

