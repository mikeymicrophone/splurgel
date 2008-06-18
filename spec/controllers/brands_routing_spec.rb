require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BrandsController do
  describe "route generation" do

    it "should map { :controller => 'brands', :action => 'index' } to /brands" do
      route_for(:controller => "brands", :action => "index").should == "/brands"
    end
  
    it "should map { :controller => 'brands', :action => 'new' } to /brands/new" do
      route_for(:controller => "brands", :action => "new").should == "/brands/new"
    end
  
    it "should map { :controller => 'brands', :action => 'show', :id => 1 } to /brands/1" do
      route_for(:controller => "brands", :action => "show", :id => 1).should == "/brands/1"
    end
  
    it "should map { :controller => 'brands', :action => 'edit', :id => 1 } to /brands/1/edit" do
      route_for(:controller => "brands", :action => "edit", :id => 1).should == "/brands/1/edit"
    end
  
    it "should map { :controller => 'brands', :action => 'update', :id => 1} to /brands/1" do
      route_for(:controller => "brands", :action => "update", :id => 1).should == "/brands/1"
    end
  
    it "should map { :controller => 'brands', :action => 'destroy', :id => 1} to /brands/1" do
      route_for(:controller => "brands", :action => "destroy", :id => 1).should == "/brands/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'brands', action => 'index' } from GET /brands" do
      params_from(:get, "/brands").should == {:controller => "brands", :action => "index"}
    end
  
    it "should generate params { :controller => 'brands', action => 'new' } from GET /brands/new" do
      params_from(:get, "/brands/new").should == {:controller => "brands", :action => "new"}
    end
  
    it "should generate params { :controller => 'brands', action => 'create' } from POST /brands" do
      params_from(:post, "/brands").should == {:controller => "brands", :action => "create"}
    end
  
    it "should generate params { :controller => 'brands', action => 'show', id => '1' } from GET /brands/1" do
      params_from(:get, "/brands/1").should == {:controller => "brands", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'brands', action => 'edit', id => '1' } from GET /brands/1;edit" do
      params_from(:get, "/brands/1/edit").should == {:controller => "brands", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'brands', action => 'update', id => '1' } from PUT /brands/1" do
      params_from(:put, "/brands/1").should == {:controller => "brands", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'brands', action => 'destroy', id => '1' } from DELETE /brands/1" do
      params_from(:delete, "/brands/1").should == {:controller => "brands", :action => "destroy", :id => "1"}
    end
  end
end
