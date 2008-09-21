require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/blog_posts/show.html.erb" do
  include BlogPostsHelper
  
  before(:each) do
    assigns[:blog_post] = @blog_post = stub_model(BlogPost,
    )
  end

  it "should render attributes in <p>" do
    render "/blog_posts/show.html.erb"
  end
end

