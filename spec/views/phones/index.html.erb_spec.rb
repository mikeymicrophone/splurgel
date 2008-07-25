require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/phones/index.html.erb" do
  include PhonesHelper
  
  before(:each) do
    phone_98 = mock_model(Phone)
    phone_99 = mock_model(Phone)

    assigns[:phones] = [phone_98, phone_99]
  end

  it "should render list of phones" do
    render "/phones/index.html.erb"
  end
end

