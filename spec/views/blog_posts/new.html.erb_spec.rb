require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/blog_posts/new.html.erb" do
  include BlogPostsHelper
  
  before(:each) do
    assigns[:blog_post] = stub_model(BlogPost,
      :new_record? => true,
    )
  end

  it "should render new form" do
    render "/blog_posts/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", blog_posts_path) do
    end
  end
end


