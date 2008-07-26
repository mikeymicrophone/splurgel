require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/authorizations/edit.html.erb" do
  include AuthorizationsHelper
  
  before do
    @authorization = mock_model(Authorization)
    @authorization.stub!(:user_id).and_return("1")
    @authorization.stub!(:authorization_type).and_return("1")
    @authorization.stub!(:target_type).and_return("MyString")
    @authorization.stub!(:target_id).and_return("1")
    assigns[:authorization] = @authorization
  end

  it "should render edit form" do
    render "/authorizations/edit.html.erb"
    
    response.should have_tag("form[action=#{authorization_path(@authorization)}][method=post]") do
      with_tag('input#authorization_authorization_type[name=?]', "authorization[authorization_type]")
      with_tag('input#authorization_target_type[name=?]', "authorization[target_type]")
    end
  end
end


