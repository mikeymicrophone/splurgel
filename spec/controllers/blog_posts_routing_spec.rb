require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BlogPostsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "blog_posts", :action => "index").should == "/blog_posts"
    end
  
    it "should map #new" do
      route_for(:controller => "blog_posts", :action => "new").should == "/blog_posts/new"
    end
  
    it "should map #show" do
      route_for(:controller => "blog_posts", :action => "show", :id => 1).should == "/blog_posts/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "blog_posts", :action => "edit", :id => 1).should == "/blog_posts/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "blog_posts", :action => "update", :id => 1).should == "/blog_posts/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "blog_posts", :action => "destroy", :id => 1).should == "/blog_posts/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/blog_posts").should == {:controller => "blog_posts", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/blog_posts/new").should == {:controller => "blog_posts", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/blog_posts").should == {:controller => "blog_posts", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/blog_posts/1").should == {:controller => "blog_posts", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/blog_posts/1/edit").should == {:controller => "blog_posts", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/blog_posts/1").should == {:controller => "blog_posts", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/blog_posts/1").should == {:controller => "blog_posts", :action => "destroy", :id => "1"}
    end
  end
end
