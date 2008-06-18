require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FollowingsController do
  describe "route generation" do

    it "should map { :controller => 'followings', :action => 'index' } to /followings" do
      route_for(:controller => "followings", :action => "index").should == "/followings"
    end
  
    it "should map { :controller => 'followings', :action => 'new' } to /followings/new" do
      route_for(:controller => "followings", :action => "new").should == "/followings/new"
    end
  
    it "should map { :controller => 'followings', :action => 'show', :id => 1 } to /followings/1" do
      route_for(:controller => "followings", :action => "show", :id => 1).should == "/followings/1"
    end
  
    it "should map { :controller => 'followings', :action => 'edit', :id => 1 } to /followings/1/edit" do
      route_for(:controller => "followings", :action => "edit", :id => 1).should == "/followings/1/edit"
    end
  
    it "should map { :controller => 'followings', :action => 'update', :id => 1} to /followings/1" do
      route_for(:controller => "followings", :action => "update", :id => 1).should == "/followings/1"
    end
  
    it "should map { :controller => 'followings', :action => 'destroy', :id => 1} to /followings/1" do
      route_for(:controller => "followings", :action => "destroy", :id => 1).should == "/followings/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'followings', action => 'index' } from GET /followings" do
      params_from(:get, "/followings").should == {:controller => "followings", :action => "index"}
    end
  
    it "should generate params { :controller => 'followings', action => 'new' } from GET /followings/new" do
      params_from(:get, "/followings/new").should == {:controller => "followings", :action => "new"}
    end
  
    it "should generate params { :controller => 'followings', action => 'create' } from POST /followings" do
      params_from(:post, "/followings").should == {:controller => "followings", :action => "create"}
    end
  
    it "should generate params { :controller => 'followings', action => 'show', id => '1' } from GET /followings/1" do
      params_from(:get, "/followings/1").should == {:controller => "followings", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'followings', action => 'edit', id => '1' } from GET /followings/1;edit" do
      params_from(:get, "/followings/1/edit").should == {:controller => "followings", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'followings', action => 'update', id => '1' } from PUT /followings/1" do
      params_from(:put, "/followings/1").should == {:controller => "followings", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'followings', action => 'destroy', id => '1' } from DELETE /followings/1" do
      params_from(:delete, "/followings/1").should == {:controller => "followings", :action => "destroy", :id => "1"}
    end
  end
end
