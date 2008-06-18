require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MembershipsController do
  describe "route generation" do

    it "should map { :controller => 'memberships', :action => 'index' } to /memberships" do
      route_for(:controller => "memberships", :action => "index").should == "/memberships"
    end
  
    it "should map { :controller => 'memberships', :action => 'new' } to /memberships/new" do
      route_for(:controller => "memberships", :action => "new").should == "/memberships/new"
    end
  
    it "should map { :controller => 'memberships', :action => 'show', :id => 1 } to /memberships/1" do
      route_for(:controller => "memberships", :action => "show", :id => 1).should == "/memberships/1"
    end
  
    it "should map { :controller => 'memberships', :action => 'edit', :id => 1 } to /memberships/1/edit" do
      route_for(:controller => "memberships", :action => "edit", :id => 1).should == "/memberships/1/edit"
    end
  
    it "should map { :controller => 'memberships', :action => 'update', :id => 1} to /memberships/1" do
      route_for(:controller => "memberships", :action => "update", :id => 1).should == "/memberships/1"
    end
  
    it "should map { :controller => 'memberships', :action => 'destroy', :id => 1} to /memberships/1" do
      route_for(:controller => "memberships", :action => "destroy", :id => 1).should == "/memberships/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'memberships', action => 'index' } from GET /memberships" do
      params_from(:get, "/memberships").should == {:controller => "memberships", :action => "index"}
    end
  
    it "should generate params { :controller => 'memberships', action => 'new' } from GET /memberships/new" do
      params_from(:get, "/memberships/new").should == {:controller => "memberships", :action => "new"}
    end
  
    it "should generate params { :controller => 'memberships', action => 'create' } from POST /memberships" do
      params_from(:post, "/memberships").should == {:controller => "memberships", :action => "create"}
    end
  
    it "should generate params { :controller => 'memberships', action => 'show', id => '1' } from GET /memberships/1" do
      params_from(:get, "/memberships/1").should == {:controller => "memberships", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'memberships', action => 'edit', id => '1' } from GET /memberships/1;edit" do
      params_from(:get, "/memberships/1/edit").should == {:controller => "memberships", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'memberships', action => 'update', id => '1' } from PUT /memberships/1" do
      params_from(:put, "/memberships/1").should == {:controller => "memberships", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'memberships', action => 'destroy', id => '1' } from DELETE /memberships/1" do
      params_from(:delete, "/memberships/1").should == {:controller => "memberships", :action => "destroy", :id => "1"}
    end
  end
end
