require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TagsController do
  describe "route generation" do

    it "should map { :controller => 'tags', :action => 'index' } to /tags" do
      route_for(:controller => "tags", :action => "index").should == "/tags"
    end
  
    it "should map { :controller => 'tags', :action => 'new' } to /tags/new" do
      route_for(:controller => "tags", :action => "new").should == "/tags/new"
    end
  
    it "should map { :controller => 'tags', :action => 'show', :id => 1 } to /tags/1" do
      route_for(:controller => "tags", :action => "show", :id => 1).should == "/tags/1"
    end
  
    it "should map { :controller => 'tags', :action => 'edit', :id => 1 } to /tags/1/edit" do
      route_for(:controller => "tags", :action => "edit", :id => 1).should == "/tags/1/edit"
    end
  
    it "should map { :controller => 'tags', :action => 'update', :id => 1} to /tags/1" do
      route_for(:controller => "tags", :action => "update", :id => 1).should == "/tags/1"
    end
  
    it "should map { :controller => 'tags', :action => 'destroy', :id => 1} to /tags/1" do
      route_for(:controller => "tags", :action => "destroy", :id => 1).should == "/tags/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'tags', action => 'index' } from GET /tags" do
      params_from(:get, "/tags").should == {:controller => "tags", :action => "index"}
    end
  
    it "should generate params { :controller => 'tags', action => 'new' } from GET /tags/new" do
      params_from(:get, "/tags/new").should == {:controller => "tags", :action => "new"}
    end
  
    it "should generate params { :controller => 'tags', action => 'create' } from POST /tags" do
      params_from(:post, "/tags").should == {:controller => "tags", :action => "create"}
    end
  
    it "should generate params { :controller => 'tags', action => 'show', id => '1' } from GET /tags/1" do
      params_from(:get, "/tags/1").should == {:controller => "tags", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'tags', action => 'edit', id => '1' } from GET /tags/1;edit" do
      params_from(:get, "/tags/1/edit").should == {:controller => "tags", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'tags', action => 'update', id => '1' } from PUT /tags/1" do
      params_from(:put, "/tags/1").should == {:controller => "tags", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'tags', action => 'destroy', id => '1' } from DELETE /tags/1" do
      params_from(:delete, "/tags/1").should == {:controller => "tags", :action => "destroy", :id => "1"}
    end
  end
end
