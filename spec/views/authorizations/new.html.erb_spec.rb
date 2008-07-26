require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/authorizations/new.html.erb" do
  include AuthorizationsHelper
  
  before(:each) do
    @authorization = mock_model(Authorization)
    @authorization.stub!(:new_record?).and_return(true)
    @authorization.stub!(:user_id).and_return("1")
    @authorization.stub!(:authorization_type).and_return("1")
    @authorization.stub!(:target_type).and_return("MyString")
    @authorization.stub!(:target_id).and_return("1")
    assigns[:authorization] = @authorization
  end

  it "should render new form" do
    render "/authorizations/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", authorizations_path) do
      with_tag("input#authorization_authorization_type[name=?]", "authorization[authorization_type]")
      with_tag("input#authorization_target_type[name=?]", "authorization[target_type]")
    end
  end
end


