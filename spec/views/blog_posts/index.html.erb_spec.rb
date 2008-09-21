require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/blog_posts/index.html.erb" do
  include BlogPostsHelper
  
  before(:each) do
    assigns[:blog_posts] = [
      stub_model(BlogPost,
      ),
      stub_model(BlogPost,
      )
    ]
  end

  it "should render list of blog_posts" do
    render "/blog_posts/index.html.erb"
  end
end

