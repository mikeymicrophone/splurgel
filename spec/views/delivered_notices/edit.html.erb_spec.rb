require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/delivered_notices/edit.html.erb" do
  include DeliveredNoticesHelper
  
  before(:each) do
    assigns[:delivered_notice] = @delivered_notice = stub_model(DeliveredNotice,
      :new_record? => false,
    )
  end

  it "should render edit form" do
    render "/delivered_notices/edit.html.erb"
    
    response.should have_tag("form[action=#{delivered_notice_path(@delivered_notice)}][method=post]") do
    end
  end
end


