require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/phone_uses/show.html.erb" do
  include PhoneUsesHelper
  
  before(:each) do
    @phone_use = mock_model(PhoneUse)

    assigns[:phone_use] = @phone_use
  end

  it "should render attributes in <p>" do
    render "/phone_uses/show.html.erb"
  end
end

