require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/delivered_notices/show.html.erb" do
  include DeliveredNoticesHelper
  
  before(:each) do
    assigns[:delivered_notice] = @delivered_notice = stub_model(DeliveredNotice,
    )
  end

  it "should render attributes in <p>" do
    render "/delivered_notices/show.html.erb"
  end
end

