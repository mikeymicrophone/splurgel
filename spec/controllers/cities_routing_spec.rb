require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CitiesController do
  describe "route generation" do

    it "should map { :controller => 'cities', :action => 'index' } to /cities" do
      route_for(:controller => "cities", :action => "index").should == "/cities"
    end
  
    it "should map { :controller => 'cities', :action => 'new' } to /cities/new" do
      route_for(:controller => "cities", :action => "new").should == "/cities/new"
    end
  
    it "should map { :controller => 'cities', :action => 'show', :id => 1 } to /cities/1" do
      route_for(:controller => "cities", :action => "show", :id => 1).should == "/cities/1"
    end
  
    it "should map { :controller => 'cities', :action => 'edit', :id => 1 } to /cities/1/edit" do
      route_for(:controller => "cities", :action => "edit", :id => 1).should == "/cities/1/edit"
    end
  
    it "should map { :controller => 'cities', :action => 'update', :id => 1} to /cities/1" do
      route_for(:controller => "cities", :action => "update", :id => 1).should == "/cities/1"
    end
  
    it "should map { :controller => 'cities', :action => 'destroy', :id => 1} to /cities/1" do
      route_for(:controller => "cities", :action => "destroy", :id => 1).should == "/cities/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'cities', action => 'index' } from GET /cities" do
      params_from(:get, "/cities").should == {:controller => "cities", :action => "index"}
    end
  
    it "should generate params { :controller => 'cities', action => 'new' } from GET /cities/new" do
      params_from(:get, "/cities/new").should == {:controller => "cities", :action => "new"}
    end
  
    it "should generate params { :controller => 'cities', action => 'create' } from POST /cities" do
      params_from(:post, "/cities").should == {:controller => "cities", :action => "create"}
    end
  
    it "should generate params { :controller => 'cities', action => 'show', id => '1' } from GET /cities/1" do
      params_from(:get, "/cities/1").should == {:controller => "cities", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'cities', action => 'edit', id => '1' } from GET /cities/1;edit" do
      params_from(:get, "/cities/1/edit").should == {:controller => "cities", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'cities', action => 'update', id => '1' } from PUT /cities/1" do
      params_from(:put, "/cities/1").should == {:controller => "cities", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'cities', action => 'destroy', id => '1' } from DELETE /cities/1" do
      params_from(:delete, "/cities/1").should == {:controller => "cities", :action => "destroy", :id => "1"}
    end
  end
end
