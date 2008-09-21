require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/post_topics/edit.html.erb" do
  include PostTopicsHelper
  
  before(:each) do
    assigns[:post_topic] = @post_topic = stub_model(PostTopic,
      :new_record? => false,
      :target_type => "value for target_type",
    )
  end

  it "should render edit form" do
    render "/post_topics/edit.html.erb"
    
    response.should have_tag("form[action=#{post_topic_path(@post_topic)}][method=post]") do
      with_tag('input#post_topic_target_type[name=?]', "post_topic[target_type]")
    end
  end
end


