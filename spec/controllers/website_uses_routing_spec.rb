require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WebsiteUsesController do
  describe "route generation" do

    it "should map { :controller => 'website_uses', :action => 'index' } to /website_uses" do
      route_for(:controller => "website_uses", :action => "index").should == "/website_uses"
    end
  
    it "should map { :controller => 'website_uses', :action => 'new' } to /website_uses/new" do
      route_for(:controller => "website_uses", :action => "new").should == "/website_uses/new"
    end
  
    it "should map { :controller => 'website_uses', :action => 'show', :id => 1 } to /website_uses/1" do
      route_for(:controller => "website_uses", :action => "show", :id => 1).should == "/website_uses/1"
    end
  
    it "should map { :controller => 'website_uses', :action => 'edit', :id => 1 } to /website_uses/1/edit" do
      route_for(:controller => "website_uses", :action => "edit", :id => 1).should == "/website_uses/1/edit"
    end
  
    it "should map { :controller => 'website_uses', :action => 'update', :id => 1} to /website_uses/1" do
      route_for(:controller => "website_uses", :action => "update", :id => 1).should == "/website_uses/1"
    end
  
    it "should map { :controller => 'website_uses', :action => 'destroy', :id => 1} to /website_uses/1" do
      route_for(:controller => "website_uses", :action => "destroy", :id => 1).should == "/website_uses/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'website_uses', action => 'index' } from GET /website_uses" do
      params_from(:get, "/website_uses").should == {:controller => "website_uses", :action => "index"}
    end
  
    it "should generate params { :controller => 'website_uses', action => 'new' } from GET /website_uses/new" do
      params_from(:get, "/website_uses/new").should == {:controller => "website_uses", :action => "new"}
    end
  
    it "should generate params { :controller => 'website_uses', action => 'create' } from POST /website_uses" do
      params_from(:post, "/website_uses").should == {:controller => "website_uses", :action => "create"}
    end
  
    it "should generate params { :controller => 'website_uses', action => 'show', id => '1' } from GET /website_uses/1" do
      params_from(:get, "/website_uses/1").should == {:controller => "website_uses", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'website_uses', action => 'edit', id => '1' } from GET /website_uses/1;edit" do
      params_from(:get, "/website_uses/1/edit").should == {:controller => "website_uses", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'website_uses', action => 'update', id => '1' } from PUT /website_uses/1" do
      params_from(:put, "/website_uses/1").should == {:controller => "website_uses", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'website_uses', action => 'destroy', id => '1' } from DELETE /website_uses/1" do
      params_from(:delete, "/website_uses/1").should == {:controller => "website_uses", :action => "destroy", :id => "1"}
    end
  end
end
