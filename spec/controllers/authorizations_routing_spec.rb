require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AuthorizationsController do
  describe "route generation" do

    it "should map { :controller => 'authorizations', :action => 'index' } to /authorizations" do
      route_for(:controller => "authorizations", :action => "index").should == "/authorizations"
    end
  
    it "should map { :controller => 'authorizations', :action => 'new' } to /authorizations/new" do
      route_for(:controller => "authorizations", :action => "new").should == "/authorizations/new"
    end
  
    it "should map { :controller => 'authorizations', :action => 'show', :id => 1 } to /authorizations/1" do
      route_for(:controller => "authorizations", :action => "show", :id => 1).should == "/authorizations/1"
    end
  
    it "should map { :controller => 'authorizations', :action => 'edit', :id => 1 } to /authorizations/1/edit" do
      route_for(:controller => "authorizations", :action => "edit", :id => 1).should == "/authorizations/1/edit"
    end
  
    it "should map { :controller => 'authorizations', :action => 'update', :id => 1} to /authorizations/1" do
      route_for(:controller => "authorizations", :action => "update", :id => 1).should == "/authorizations/1"
    end
  
    it "should map { :controller => 'authorizations', :action => 'destroy', :id => 1} to /authorizations/1" do
      route_for(:controller => "authorizations", :action => "destroy", :id => 1).should == "/authorizations/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'authorizations', action => 'index' } from GET /authorizations" do
      params_from(:get, "/authorizations").should == {:controller => "authorizations", :action => "index"}
    end
  
    it "should generate params { :controller => 'authorizations', action => 'new' } from GET /authorizations/new" do
      params_from(:get, "/authorizations/new").should == {:controller => "authorizations", :action => "new"}
    end
  
    it "should generate params { :controller => 'authorizations', action => 'create' } from POST /authorizations" do
      params_from(:post, "/authorizations").should == {:controller => "authorizations", :action => "create"}
    end
  
    it "should generate params { :controller => 'authorizations', action => 'show', id => '1' } from GET /authorizations/1" do
      params_from(:get, "/authorizations/1").should == {:controller => "authorizations", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'authorizations', action => 'edit', id => '1' } from GET /authorizations/1;edit" do
      params_from(:get, "/authorizations/1/edit").should == {:controller => "authorizations", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'authorizations', action => 'update', id => '1' } from PUT /authorizations/1" do
      params_from(:put, "/authorizations/1").should == {:controller => "authorizations", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'authorizations', action => 'destroy', id => '1' } from DELETE /authorizations/1" do
      params_from(:delete, "/authorizations/1").should == {:controller => "authorizations", :action => "destroy", :id => "1"}
    end
  end
end
