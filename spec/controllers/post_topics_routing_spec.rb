require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PostTopicsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "post_topics", :action => "index").should == "/post_topics"
    end
  
    it "should map #new" do
      route_for(:controller => "post_topics", :action => "new").should == "/post_topics/new"
    end
  
    it "should map #show" do
      route_for(:controller => "post_topics", :action => "show", :id => 1).should == "/post_topics/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "post_topics", :action => "edit", :id => 1).should == "/post_topics/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "post_topics", :action => "update", :id => 1).should == "/post_topics/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "post_topics", :action => "destroy", :id => 1).should == "/post_topics/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/post_topics").should == {:controller => "post_topics", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/post_topics/new").should == {:controller => "post_topics", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/post_topics").should == {:controller => "post_topics", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/post_topics/1").should == {:controller => "post_topics", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/post_topics/1/edit").should == {:controller => "post_topics", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/post_topics/1").should == {:controller => "post_topics", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/post_topics/1").should == {:controller => "post_topics", :action => "destroy", :id => "1"}
    end
  end
end
