require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StatesController do
  describe "route generation" do

    it "should map { :controller => 'states', :action => 'index' } to /states" do
      route_for(:controller => "states", :action => "index").should == "/states"
    end
  
    it "should map { :controller => 'states', :action => 'new' } to /states/new" do
      route_for(:controller => "states", :action => "new").should == "/states/new"
    end
  
    it "should map { :controller => 'states', :action => 'show', :id => 1 } to /states/1" do
      route_for(:controller => "states", :action => "show", :id => 1).should == "/states/1"
    end
  
    it "should map { :controller => 'states', :action => 'edit', :id => 1 } to /states/1/edit" do
      route_for(:controller => "states", :action => "edit", :id => 1).should == "/states/1/edit"
    end
  
    it "should map { :controller => 'states', :action => 'update', :id => 1} to /states/1" do
      route_for(:controller => "states", :action => "update", :id => 1).should == "/states/1"
    end
  
    it "should map { :controller => 'states', :action => 'destroy', :id => 1} to /states/1" do
      route_for(:controller => "states", :action => "destroy", :id => 1).should == "/states/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'states', action => 'index' } from GET /states" do
      params_from(:get, "/states").should == {:controller => "states", :action => "index"}
    end
  
    it "should generate params { :controller => 'states', action => 'new' } from GET /states/new" do
      params_from(:get, "/states/new").should == {:controller => "states", :action => "new"}
    end
  
    it "should generate params { :controller => 'states', action => 'create' } from POST /states" do
      params_from(:post, "/states").should == {:controller => "states", :action => "create"}
    end
  
    it "should generate params { :controller => 'states', action => 'show', id => '1' } from GET /states/1" do
      params_from(:get, "/states/1").should == {:controller => "states", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'states', action => 'edit', id => '1' } from GET /states/1;edit" do
      params_from(:get, "/states/1/edit").should == {:controller => "states", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'states', action => 'update', id => '1' } from PUT /states/1" do
      params_from(:put, "/states/1").should == {:controller => "states", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'states', action => 'destroy', id => '1' } from DELETE /states/1" do
      params_from(:delete, "/states/1").should == {:controller => "states", :action => "destroy", :id => "1"}
    end
  end
end
