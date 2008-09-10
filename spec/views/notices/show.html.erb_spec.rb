require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/notices/show.html.erb" do
  include NoticesHelper
  
  before(:each) do
    assigns[:notice] = @notice = stub_model(Notice,
      :target_type => "value for target_type",
      :followed_type => "value for followed_type",
      :secondary_targets => "value for secondary_targets",
      :private => "value for private",
    )
  end

  it "should render attributes in <p>" do
    render "/notices/show.html.erb"
    response.should have_text(/value\ for\ target_type/)
    response.should have_text(/value\ for\ followed_type/)
    response.should have_text(/value\ for\ secondary_targets/)
    response.should have_text(/value\ for\ private/)
  end
end

