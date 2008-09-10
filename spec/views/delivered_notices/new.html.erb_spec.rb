require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/delivered_notices/new.html.erb" do
  include DeliveredNoticesHelper
  
  before(:each) do
    assigns[:delivered_notice] = stub_model(DeliveredNotice,
      :new_record? => true,
    )
  end

  it "should render new form" do
    render "/delivered_notices/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", delivered_notices_path) do
    end
  end
end


