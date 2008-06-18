require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TaggingsController do
  describe "route generation" do

    it "should map { :controller => 'taggings', :action => 'index' } to /taggings" do
      route_for(:controller => "taggings", :action => "index").should == "/taggings"
    end
  
    it "should map { :controller => 'taggings', :action => 'new' } to /taggings/new" do
      route_for(:controller => "taggings", :action => "new").should == "/taggings/new"
    end
  
    it "should map { :controller => 'taggings', :action => 'show', :id => 1 } to /taggings/1" do
      route_for(:controller => "taggings", :action => "show", :id => 1).should == "/taggings/1"
    end
  
    it "should map { :controller => 'taggings', :action => 'edit', :id => 1 } to /taggings/1/edit" do
      route_for(:controller => "taggings", :action => "edit", :id => 1).should == "/taggings/1/edit"
    end
  
    it "should map { :controller => 'taggings', :action => 'update', :id => 1} to /taggings/1" do
      route_for(:controller => "taggings", :action => "update", :id => 1).should == "/taggings/1"
    end
  
    it "should map { :controller => 'taggings', :action => 'destroy', :id => 1} to /taggings/1" do
      route_for(:controller => "taggings", :action => "destroy", :id => 1).should == "/taggings/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'taggings', action => 'index' } from GET /taggings" do
      params_from(:get, "/taggings").should == {:controller => "taggings", :action => "index"}
    end
  
    it "should generate params { :controller => 'taggings', action => 'new' } from GET /taggings/new" do
      params_from(:get, "/taggings/new").should == {:controller => "taggings", :action => "new"}
    end
  
    it "should generate params { :controller => 'taggings', action => 'create' } from POST /taggings" do
      params_from(:post, "/taggings").should == {:controller => "taggings", :action => "create"}
    end
  
    it "should generate params { :controller => 'taggings', action => 'show', id => '1' } from GET /taggings/1" do
      params_from(:get, "/taggings/1").should == {:controller => "taggings", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'taggings', action => 'edit', id => '1' } from GET /taggings/1;edit" do
      params_from(:get, "/taggings/1/edit").should == {:controller => "taggings", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'taggings', action => 'update', id => '1' } from PUT /taggings/1" do
      params_from(:put, "/taggings/1").should == {:controller => "taggings", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'taggings', action => 'destroy', id => '1' } from DELETE /taggings/1" do
      params_from(:delete, "/taggings/1").should == {:controller => "taggings", :action => "destroy", :id => "1"}
    end
  end
end
