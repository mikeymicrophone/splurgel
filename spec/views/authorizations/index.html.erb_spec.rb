require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/authorizations/index.html.erb" do
  include AuthorizationsHelper
  
  before(:each) do
    authorization_98 = mock_model(Authorization)
    authorization_98.should_receive(:user_id).and_return("1")
    authorization_98.should_receive(:authorization_type).and_return("1")
    authorization_98.should_receive(:target_type).and_return("MyString")
    authorization_98.should_receive(:target_id).and_return("1")
    authorization_99 = mock_model(Authorization)
    authorization_99.should_receive(:user_id).and_return("1")
    authorization_99.should_receive(:authorization_type).and_return("1")
    authorization_99.should_receive(:target_type).and_return("MyString")
    authorization_99.should_receive(:target_id).and_return("1")

    assigns[:authorizations] = [authorization_98, authorization_99]
  end

  it "should render list of authorizations" do
    render "/authorizations/index.html.erb"
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

