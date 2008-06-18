require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StoresController do
  describe "route generation" do

    it "should map { :controller => 'stores', :action => 'index' } to /stores" do
      route_for(:controller => "stores", :action => "index").should == "/stores"
    end
  
    it "should map { :controller => 'stores', :action => 'new' } to /stores/new" do
      route_for(:controller => "stores", :action => "new").should == "/stores/new"
    end
  
    it "should map { :controller => 'stores', :action => 'show', :id => 1 } to /stores/1" do
      route_for(:controller => "stores", :action => "show", :id => 1).should == "/stores/1"
    end
  
    it "should map { :controller => 'stores', :action => 'edit', :id => 1 } to /stores/1/edit" do
      route_for(:controller => "stores", :action => "edit", :id => 1).should == "/stores/1/edit"
    end
  
    it "should map { :controller => 'stores', :action => 'update', :id => 1} to /stores/1" do
      route_for(:controller => "stores", :action => "update", :id => 1).should == "/stores/1"
    end
  
    it "should map { :controller => 'stores', :action => 'destroy', :id => 1} to /stores/1" do
      route_for(:controller => "stores", :action => "destroy", :id => 1).should == "/stores/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'stores', action => 'index' } from GET /stores" do
      params_from(:get, "/stores").should == {:controller => "stores", :action => "index"}
    end
  
    it "should generate params { :controller => 'stores', action => 'new' } from GET /stores/new" do
      params_from(:get, "/stores/new").should == {:controller => "stores", :action => "new"}
    end
  
    it "should generate params { :controller => 'stores', action => 'create' } from POST /stores" do
      params_from(:post, "/stores").should == {:controller => "stores", :action => "create"}
    end
  
    it "should generate params { :controller => 'stores', action => 'show', id => '1' } from GET /stores/1" do
      params_from(:get, "/stores/1").should == {:controller => "stores", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'stores', action => 'edit', id => '1' } from GET /stores/1;edit" do
      params_from(:get, "/stores/1/edit").should == {:controller => "stores", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'stores', action => 'update', id => '1' } from PUT /stores/1" do
      params_from(:put, "/stores/1").should == {:controller => "stores", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'stores', action => 'destroy', id => '1' } from DELETE /stores/1" do
      params_from(:delete, "/stores/1").should == {:controller => "stores", :action => "destroy", :id => "1"}
    end
  end
end
