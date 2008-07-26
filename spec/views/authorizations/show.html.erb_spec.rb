require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/authorizations/show.html.erb" do
  include AuthorizationsHelper
  
  before(:each) do
    @authorization = mock_model(Authorization)
    @authorization.stub!(:user_id).and_return("1")
    @authorization.stub!(:authorization_type).and_return("1")
    @authorization.stub!(:target_type).and_return("MyString")
    @authorization.stub!(:target_id).and_return("1")

    assigns[:authorization] = @authorization
  end

  it "should render attributes in <p>" do
    render "/authorizations/show.html.erb"
    response.should have_text(/1/)
    response.should have_text(/MyString/)
  end
end

