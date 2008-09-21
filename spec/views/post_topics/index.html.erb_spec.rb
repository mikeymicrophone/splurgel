require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/post_topics/index.html.erb" do
  include PostTopicsHelper
  
  before(:each) do
    assigns[:post_topics] = [
      stub_model(PostTopic,
        :target_type => "value for target_type",
      ),
      stub_model(PostTopic,
        :target_type => "value for target_type",
      )
    ]
  end

  it "should render list of post_topics" do
    render "/post_topics/index.html.erb"
    response.should have_tag("tr>td", "value for target_type", 2)
  end
end

