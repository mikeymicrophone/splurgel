require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/post_topics/new.html.erb" do
  include PostTopicsHelper
  
  before(:each) do
    assigns[:post_topic] = stub_model(PostTopic,
      :new_record? => true,
      :target_type => "value for target_type",
    )
  end

  it "should render new form" do
    render "/post_topics/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", post_topics_path) do
      with_tag("input#post_topic_target_type[name=?]", "post_topic[target_type]")
    end
  end
end


