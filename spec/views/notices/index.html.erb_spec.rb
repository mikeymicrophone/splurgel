require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/notices/index.html.erb" do
  include NoticesHelper
  
  before(:each) do
    assigns[:notices] = [
      stub_model(Notice,
        :target_type => "value for target_type",
        :followed_type => "value for followed_type",
        :secondary_targets => "value for secondary_targets",
        :private => "value for private",
      ),
      stub_model(Notice,
        :target_type => "value for target_type",
        :followed_type => "value for followed_type",
        :secondary_targets => "value for secondary_targets",
        :private => "value for private",
      )
    ]
  end

  it "should render list of notices" do
    render "/notices/index.html.erb"
    response.should have_tag("tr>td", "value for target_type", 2)
    response.should have_tag("tr>td", "value for followed_type", 2)
    response.should have_tag("tr>td", "value for secondary_targets", 2)
    response.should have_tag("tr>td", "value for private", 2)
  end
end

