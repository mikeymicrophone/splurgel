require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AddressesController do
  describe "route generation" do

    it "should map { :controller => 'addresses', :action => 'index' } to /addresses" do
      route_for(:controller => "addresses", :action => "index").should == "/addresses"
    end
  
    it "should map { :controller => 'addresses', :action => 'new' } to /addresses/new" do
      route_for(:controller => "addresses", :action => "new").should == "/addresses/new"
    end
  
    it "should map { :controller => 'addresses', :action => 'show', :id => 1 } to /addresses/1" do
      route_for(:controller => "addresses", :action => "show", :id => 1).should == "/addresses/1"
    end
  
    it "should map { :controller => 'addresses', :action => 'edit', :id => 1 } to /addresses/1/edit" do
      route_for(:controller => "addresses", :action => "edit", :id => 1).should == "/addresses/1/edit"
    end
  
    it "should map { :controller => 'addresses', :action => 'update', :id => 1} to /addresses/1" do
      route_for(:controller => "addresses", :action => "update", :id => 1).should == "/addresses/1"
    end
  
    it "should map { :controller => 'addresses', :action => 'destroy', :id => 1} to /addresses/1" do
      route_for(:controller => "addresses", :action => "destroy", :id => 1).should == "/addresses/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'addresses', action => 'index' } from GET /addresses" do
      params_from(:get, "/addresses").should == {:controller => "addresses", :action => "index"}
    end
  
    it "should generate params { :controller => 'addresses', action => 'new' } from GET /addresses/new" do
      params_from(:get, "/addresses/new").should == {:controller => "addresses", :action => "new"}
    end
  
    it "should generate params { :controller => 'addresses', action => 'create' } from POST /addresses" do
      params_from(:post, "/addresses").should == {:controller => "addresses", :action => "create"}
    end
  
    it "should generate params { :controller => 'addresses', action => 'show', id => '1' } from GET /addresses/1" do
      params_from(:get, "/addresses/1").should == {:controller => "addresses", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'addresses', action => 'edit', id => '1' } from GET /addresses/1;edit" do
      params_from(:get, "/addresses/1/edit").should == {:controller => "addresses", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'addresses', action => 'update', id => '1' } from PUT /addresses/1" do
      params_from(:put, "/addresses/1").should == {:controller => "addresses", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'addresses', action => 'destroy', id => '1' } from DELETE /addresses/1" do
      params_from(:delete, "/addresses/1").should == {:controller => "addresses", :action => "destroy", :id => "1"}
    end
  end
end
