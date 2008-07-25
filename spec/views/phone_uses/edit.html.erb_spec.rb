require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/phone_uses/edit.html.erb" do
  include PhoneUsesHelper
  
  before do
    @phone_use = mock_model(PhoneUse)
    assigns[:phone_use] = @phone_use
  end

  it "should render edit form" do
    render "/phone_uses/edit.html.erb"
    
    response.should have_tag("form[action=#{phone_use_path(@phone_use)}][method=post]") do
    end
  end
end


