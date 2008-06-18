require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WebsitesController do
  describe "route generation" do

    it "should map { :controller => 'websites', :action => 'index' } to /websites" do
      route_for(:controller => "websites", :action => "index").should == "/websites"
    end
  
    it "should map { :controller => 'websites', :action => 'new' } to /websites/new" do
      route_for(:controller => "websites", :action => "new").should == "/websites/new"
    end
  
    it "should map { :controller => 'websites', :action => 'show', :id => 1 } to /websites/1" do
      route_for(:controller => "websites", :action => "show", :id => 1).should == "/websites/1"
    end
  
    it "should map { :controller => 'websites', :action => 'edit', :id => 1 } to /websites/1/edit" do
      route_for(:controller => "websites", :action => "edit", :id => 1).should == "/websites/1/edit"
    end
  
    it "should map { :controller => 'websites', :action => 'update', :id => 1} to /websites/1" do
      route_for(:controller => "websites", :action => "update", :id => 1).should == "/websites/1"
    end
  
    it "should map { :controller => 'websites', :action => 'destroy', :id => 1} to /websites/1" do
      route_for(:controller => "websites", :action => "destroy", :id => 1).should == "/websites/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'websites', action => 'index' } from GET /websites" do
      params_from(:get, "/websites").should == {:controller => "websites", :action => "index"}
    end
  
    it "should generate params { :controller => 'websites', action => 'new' } from GET /websites/new" do
      params_from(:get, "/websites/new").should == {:controller => "websites", :action => "new"}
    end
  
    it "should generate params { :controller => 'websites', action => 'create' } from POST /websites" do
      params_from(:post, "/websites").should == {:controller => "websites", :action => "create"}
    end
  
    it "should generate params { :controller => 'websites', action => 'show', id => '1' } from GET /websites/1" do
      params_from(:get, "/websites/1").should == {:controller => "websites", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'websites', action => 'edit', id => '1' } from GET /websites/1;edit" do
      params_from(:get, "/websites/1/edit").should == {:controller => "websites", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'websites', action => 'update', id => '1' } from PUT /websites/1" do
      params_from(:put, "/websites/1").should == {:controller => "websites", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'websites', action => 'destroy', id => '1' } from DELETE /websites/1" do
      params_from(:delete, "/websites/1").should == {:controller => "websites", :action => "destroy", :id => "1"}
    end
  end
end
