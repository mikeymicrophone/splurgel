require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/delivered_notices/index.html.erb" do
  include DeliveredNoticesHelper
  
  before(:each) do
    assigns[:delivered_notices] = [
      stub_model(DeliveredNotice,
      ),
      stub_model(DeliveredNotice,
      )
    ]
  end

  it "should render list of delivered_notices" do
    render "/delivered_notices/index.html.erb"
  end
end

