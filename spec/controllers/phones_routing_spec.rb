require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PhonesController do
  describe "route generation" do

    it "should map { :controller => 'phones', :action => 'index' } to /phones" do
      route_for(:controller => "phones", :action => "index").should == "/phones"
    end
  
    it "should map { :controller => 'phones', :action => 'new' } to /phones/new" do
      route_for(:controller => "phones", :action => "new").should == "/phones/new"
    end
  
    it "should map { :controller => 'phones', :action => 'show', :id => 1 } to /phones/1" do
      route_for(:controller => "phones", :action => "show", :id => 1).should == "/phones/1"
    end
  
    it "should map { :controller => 'phones', :action => 'edit', :id => 1 } to /phones/1/edit" do
      route_for(:controller => "phones", :action => "edit", :id => 1).should == "/phones/1/edit"
    end
  
    it "should map { :controller => 'phones', :action => 'update', :id => 1} to /phones/1" do
      route_for(:controller => "phones", :action => "update", :id => 1).should == "/phones/1"
    end
  
    it "should map { :controller => 'phones', :action => 'destroy', :id => 1} to /phones/1" do
      route_for(:controller => "phones", :action => "destroy", :id => 1).should == "/phones/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'phones', action => 'index' } from GET /phones" do
      params_from(:get, "/phones").should == {:controller => "phones", :action => "index"}
    end
  
    it "should generate params { :controller => 'phones', action => 'new' } from GET /phones/new" do
      params_from(:get, "/phones/new").should == {:controller => "phones", :action => "new"}
    end
  
    it "should generate params { :controller => 'phones', action => 'create' } from POST /phones" do
      params_from(:post, "/phones").should == {:controller => "phones", :action => "create"}
    end
  
    it "should generate params { :controller => 'phones', action => 'show', id => '1' } from GET /phones/1" do
      params_from(:get, "/phones/1").should == {:controller => "phones", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'phones', action => 'edit', id => '1' } from GET /phones/1;edit" do
      params_from(:get, "/phones/1/edit").should == {:controller => "phones", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'phones', action => 'update', id => '1' } from PUT /phones/1" do
      params_from(:put, "/phones/1").should == {:controller => "phones", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'phones', action => 'destroy', id => '1' } from DELETE /phones/1" do
      params_from(:delete, "/phones/1").should == {:controller => "phones", :action => "destroy", :id => "1"}
    end
  end
end
