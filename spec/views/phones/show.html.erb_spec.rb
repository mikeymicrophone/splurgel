require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/phones/show.html.erb" do
  include PhonesHelper
  
  before(:each) do
    @phone = mock_model(Phone)

    assigns[:phone] = @phone
  end

  it "should render attributes in <p>" do
    render "/phones/show.html.erb"
  end
end

