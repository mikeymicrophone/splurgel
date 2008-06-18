require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NetworkMembershipsController do
  describe "route generation" do

    it "should map { :controller => 'network_memberships', :action => 'index' } to /network_memberships" do
      route_for(:controller => "network_memberships", :action => "index").should == "/network_memberships"
    end
  
    it "should map { :controller => 'network_memberships', :action => 'new' } to /network_memberships/new" do
      route_for(:controller => "network_memberships", :action => "new").should == "/network_memberships/new"
    end
  
    it "should map { :controller => 'network_memberships', :action => 'show', :id => 1 } to /network_memberships/1" do
      route_for(:controller => "network_memberships", :action => "show", :id => 1).should == "/network_memberships/1"
    end
  
    it "should map { :controller => 'network_memberships', :action => 'edit', :id => 1 } to /network_memberships/1/edit" do
      route_for(:controller => "network_memberships", :action => "edit", :id => 1).should == "/network_memberships/1/edit"
    end
  
    it "should map { :controller => 'network_memberships', :action => 'update', :id => 1} to /network_memberships/1" do
      route_for(:controller => "network_memberships", :action => "update", :id => 1).should == "/network_memberships/1"
    end
  
    it "should map { :controller => 'network_memberships', :action => 'destroy', :id => 1} to /network_memberships/1" do
      route_for(:controller => "network_memberships", :action => "destroy", :id => 1).should == "/network_memberships/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'network_memberships', action => 'index' } from GET /network_memberships" do
      params_from(:get, "/network_memberships").should == {:controller => "network_memberships", :action => "index"}
    end
  
    it "should generate params { :controller => 'network_memberships', action => 'new' } from GET /network_memberships/new" do
      params_from(:get, "/network_memberships/new").should == {:controller => "network_memberships", :action => "new"}
    end
  
    it "should generate params { :controller => 'network_memberships', action => 'create' } from POST /network_memberships" do
      params_from(:post, "/network_memberships").should == {:controller => "network_memberships", :action => "create"}
    end
  
    it "should generate params { :controller => 'network_memberships', action => 'show', id => '1' } from GET /network_memberships/1" do
      params_from(:get, "/network_memberships/1").should == {:controller => "network_memberships", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'network_memberships', action => 'edit', id => '1' } from GET /network_memberships/1;edit" do
      params_from(:get, "/network_memberships/1/edit").should == {:controller => "network_memberships", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'network_memberships', action => 'update', id => '1' } from PUT /network_memberships/1" do
      params_from(:put, "/network_memberships/1").should == {:controller => "network_memberships", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'network_memberships', action => 'destroy', id => '1' } from DELETE /network_memberships/1" do
      params_from(:delete, "/network_memberships/1").should == {:controller => "network_memberships", :action => "destroy", :id => "1"}
    end
  end
end
