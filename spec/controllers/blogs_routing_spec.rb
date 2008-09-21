require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BlogsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "blogs", :action => "index").should == "/blogs"
    end
  
    it "should map #new" do
      route_for(:controller => "blogs", :action => "new").should == "/blogs/new"
    end
  
    it "should map #show" do
      route_for(:controller => "blogs", :action => "show", :id => 1).should == "/blogs/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "blogs", :action => "edit", :id => 1).should == "/blogs/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "blogs", :action => "update", :id => 1).should == "/blogs/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "blogs", :action => "destroy", :id => 1).should == "/blogs/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/blogs").should == {:controller => "blogs", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/blogs/new").should == {:controller => "blogs", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/blogs").should == {:controller => "blogs", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/blogs/1").should == {:controller => "blogs", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/blogs/1/edit").should == {:controller => "blogs", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/blogs/1").should == {:controller => "blogs", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/blogs/1").should == {:controller => "blogs", :action => "destroy", :id => "1"}
    end
  end
end
