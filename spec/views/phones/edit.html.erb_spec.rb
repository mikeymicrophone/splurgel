require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/phones/edit.html.erb" do
  include PhonesHelper
  
  before do
    @phone = mock_model(Phone)
    assigns[:phone] = @phone
  end

  it "should render edit form" do
    render "/phones/edit.html.erb"
    
    response.should have_tag("form[action=#{phone_path(@phone)}][method=post]") do
    end
  end
end


