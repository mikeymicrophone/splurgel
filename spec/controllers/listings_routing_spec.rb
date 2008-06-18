require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ListingsController do
  describe "route generation" do

    it "should map { :controller => 'listings', :action => 'index' } to /listings" do
      route_for(:controller => "listings", :action => "index").should == "/listings"
    end
  
    it "should map { :controller => 'listings', :action => 'new' } to /listings/new" do
      route_for(:controller => "listings", :action => "new").should == "/listings/new"
    end
  
    it "should map { :controller => 'listings', :action => 'show', :id => 1 } to /listings/1" do
      route_for(:controller => "listings", :action => "show", :id => 1).should == "/listings/1"
    end
  
    it "should map { :controller => 'listings', :action => 'edit', :id => 1 } to /listings/1/edit" do
      route_for(:controller => "listings", :action => "edit", :id => 1).should == "/listings/1/edit"
    end
  
    it "should map { :controller => 'listings', :action => 'update', :id => 1} to /listings/1" do
      route_for(:controller => "listings", :action => "update", :id => 1).should == "/listings/1"
    end
  
    it "should map { :controller => 'listings', :action => 'destroy', :id => 1} to /listings/1" do
      route_for(:controller => "listings", :action => "destroy", :id => 1).should == "/listings/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'listings', action => 'index' } from GET /listings" do
      params_from(:get, "/listings").should == {:controller => "listings", :action => "index"}
    end
  
    it "should generate params { :controller => 'listings', action => 'new' } from GET /listings/new" do
      params_from(:get, "/listings/new").should == {:controller => "listings", :action => "new"}
    end
  
    it "should generate params { :controller => 'listings', action => 'create' } from POST /listings" do
      params_from(:post, "/listings").should == {:controller => "listings", :action => "create"}
    end
  
    it "should generate params { :controller => 'listings', action => 'show', id => '1' } from GET /listings/1" do
      params_from(:get, "/listings/1").should == {:controller => "listings", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'listings', action => 'edit', id => '1' } from GET /listings/1;edit" do
      params_from(:get, "/listings/1/edit").should == {:controller => "listings", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'listings', action => 'update', id => '1' } from PUT /listings/1" do
      params_from(:put, "/listings/1").should == {:controller => "listings", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'listings', action => 'destroy', id => '1' } from DELETE /listings/1" do
      params_from(:delete, "/listings/1").should == {:controller => "listings", :action => "destroy", :id => "1"}
    end
  end
end
