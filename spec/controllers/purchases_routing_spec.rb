require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PurchasesController do
  describe "route generation" do

    it "should map { :controller => 'purchases', :action => 'index' } to /purchases" do
      route_for(:controller => "purchases", :action => "index").should == "/purchases"
    end
  
    it "should map { :controller => 'purchases', :action => 'new' } to /purchases/new" do
      route_for(:controller => "purchases", :action => "new").should == "/purchases/new"
    end
  
    it "should map { :controller => 'purchases', :action => 'show', :id => 1 } to /purchases/1" do
      route_for(:controller => "purchases", :action => "show", :id => 1).should == "/purchases/1"
    end
  
    it "should map { :controller => 'purchases', :action => 'edit', :id => 1 } to /purchases/1/edit" do
      route_for(:controller => "purchases", :action => "edit", :id => 1).should == "/purchases/1/edit"
    end
  
    it "should map { :controller => 'purchases', :action => 'update', :id => 1} to /purchases/1" do
      route_for(:controller => "purchases", :action => "update", :id => 1).should == "/purchases/1"
    end
  
    it "should map { :controller => 'purchases', :action => 'destroy', :id => 1} to /purchases/1" do
      route_for(:controller => "purchases", :action => "destroy", :id => 1).should == "/purchases/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'purchases', action => 'index' } from GET /purchases" do
      params_from(:get, "/purchases").should == {:controller => "purchases", :action => "index"}
    end
  
    it "should generate params { :controller => 'purchases', action => 'new' } from GET /purchases/new" do
      params_from(:get, "/purchases/new").should == {:controller => "purchases", :action => "new"}
    end
  
    it "should generate params { :controller => 'purchases', action => 'create' } from POST /purchases" do
      params_from(:post, "/purchases").should == {:controller => "purchases", :action => "create"}
    end
  
    it "should generate params { :controller => 'purchases', action => 'show', id => '1' } from GET /purchases/1" do
      params_from(:get, "/purchases/1").should == {:controller => "purchases", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'purchases', action => 'edit', id => '1' } from GET /purchases/1;edit" do
      params_from(:get, "/purchases/1/edit").should == {:controller => "purchases", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'purchases', action => 'update', id => '1' } from PUT /purchases/1" do
      params_from(:put, "/purchases/1").should == {:controller => "purchases", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'purchases', action => 'destroy', id => '1' } from DELETE /purchases/1" do
      params_from(:delete, "/purchases/1").should == {:controller => "purchases", :action => "destroy", :id => "1"}
    end
  end
end
