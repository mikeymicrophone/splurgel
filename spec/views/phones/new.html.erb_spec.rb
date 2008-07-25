require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/phones/new.html.erb" do
  include PhonesHelper
  
  before(:each) do
    @phone = mock_model(Phone)
    @phone.stub!(:new_record?).and_return(true)
    assigns[:phone] = @phone
  end

  it "should render new form" do
    render "/phones/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", phones_path) do
    end
  end
end


