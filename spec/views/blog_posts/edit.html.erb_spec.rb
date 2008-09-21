require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/blog_posts/edit.html.erb" do
  include BlogPostsHelper
  
  before(:each) do
    assigns[:blog_post] = @blog_post = stub_model(BlogPost,
      :new_record? => false,
    )
  end

  it "should render edit form" do
    render "/blog_posts/edit.html.erb"
    
    response.should have_tag("form[action=#{blog_post_path(@blog_post)}][method=post]") do
    end
  end
end


