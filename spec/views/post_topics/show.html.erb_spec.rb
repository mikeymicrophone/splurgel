require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/post_topics/show.html.erb" do
  include PostTopicsHelper
  
  before(:each) do
    assigns[:post_topic] = @post_topic = stub_model(PostTopic,
      :target_type => "value for target_type",
    )
  end

  it "should render attributes in <p>" do
    render "/post_topics/show.html.erb"
    response.should have_text(/value\ for\ target_type/)
  end
end

