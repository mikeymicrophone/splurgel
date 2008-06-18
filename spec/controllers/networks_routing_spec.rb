require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NetworksController do
  describe "route generation" do

    it "should map { :controller => 'networks', :action => 'index' } to /networks" do
      route_for(:controller => "networks", :action => "index").should == "/networks"
    end
  
    it "should map { :controller => 'networks', :action => 'new' } to /networks/new" do
      route_for(:controller => "networks", :action => "new").should == "/networks/new"
    end
  
    it "should map { :controller => 'networks', :action => 'show', :id => 1 } to /networks/1" do
      route_for(:controller => "networks", :action => "show", :id => 1).should == "/networks/1"
    end
  
    it "should map { :controller => 'networks', :action => 'edit', :id => 1 } to /networks/1/edit" do
      route_for(:controller => "networks", :action => "edit", :id => 1).should == "/networks/1/edit"
    end
  
    it "should map { :controller => 'networks', :action => 'update', :id => 1} to /networks/1" do
      route_for(:controller => "networks", :action => "update", :id => 1).should == "/networks/1"
    end
  
    it "should map { :controller => 'networks', :action => 'destroy', :id => 1} to /networks/1" do
      route_for(:controller => "networks", :action => "destroy", :id => 1).should == "/networks/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'networks', action => 'index' } from GET /networks" do
      params_from(:get, "/networks").should == {:controller => "networks", :action => "index"}
    end
  
    it "should generate params { :controller => 'networks', action => 'new' } from GET /networks/new" do
      params_from(:get, "/networks/new").should == {:controller => "networks", :action => "new"}
    end
  
    it "should generate params { :controller => 'networks', action => 'create' } from POST /networks" do
      params_from(:post, "/networks").should == {:controller => "networks", :action => "create"}
    end
  
    it "should generate params { :controller => 'networks', action => 'show', id => '1' } from GET /networks/1" do
      params_from(:get, "/networks/1").should == {:controller => "networks", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'networks', action => 'edit', id => '1' } from GET /networks/1;edit" do
      params_from(:get, "/networks/1/edit").should == {:controller => "networks", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'networks', action => 'update', id => '1' } from PUT /networks/1" do
      params_from(:put, "/networks/1").should == {:controller => "networks", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'networks', action => 'destroy', id => '1' } from DELETE /networks/1" do
      params_from(:delete, "/networks/1").should == {:controller => "networks", :action => "destroy", :id => "1"}
    end
  end
end
