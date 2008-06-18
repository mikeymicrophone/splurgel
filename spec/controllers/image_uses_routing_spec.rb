require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ImageUsesController do
  describe "route generation" do

    it "should map { :controller => 'image_uses', :action => 'index' } to /image_uses" do
      route_for(:controller => "image_uses", :action => "index").should == "/image_uses"
    end
  
    it "should map { :controller => 'image_uses', :action => 'new' } to /image_uses/new" do
      route_for(:controller => "image_uses", :action => "new").should == "/image_uses/new"
    end
  
    it "should map { :controller => 'image_uses', :action => 'show', :id => 1 } to /image_uses/1" do
      route_for(:controller => "image_uses", :action => "show", :id => 1).should == "/image_uses/1"
    end
  
    it "should map { :controller => 'image_uses', :action => 'edit', :id => 1 } to /image_uses/1/edit" do
      route_for(:controller => "image_uses", :action => "edit", :id => 1).should == "/image_uses/1/edit"
    end
  
    it "should map { :controller => 'image_uses', :action => 'update', :id => 1} to /image_uses/1" do
      route_for(:controller => "image_uses", :action => "update", :id => 1).should == "/image_uses/1"
    end
  
    it "should map { :controller => 'image_uses', :action => 'destroy', :id => 1} to /image_uses/1" do
      route_for(:controller => "image_uses", :action => "destroy", :id => 1).should == "/image_uses/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'image_uses', action => 'index' } from GET /image_uses" do
      params_from(:get, "/image_uses").should == {:controller => "image_uses", :action => "index"}
    end
  
    it "should generate params { :controller => 'image_uses', action => 'new' } from GET /image_uses/new" do
      params_from(:get, "/image_uses/new").should == {:controller => "image_uses", :action => "new"}
    end
  
    it "should generate params { :controller => 'image_uses', action => 'create' } from POST /image_uses" do
      params_from(:post, "/image_uses").should == {:controller => "image_uses", :action => "create"}
    end
  
    it "should generate params { :controller => 'image_uses', action => 'show', id => '1' } from GET /image_uses/1" do
      params_from(:get, "/image_uses/1").should == {:controller => "image_uses", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'image_uses', action => 'edit', id => '1' } from GET /image_uses/1;edit" do
      params_from(:get, "/image_uses/1/edit").should == {:controller => "image_uses", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'image_uses', action => 'update', id => '1' } from PUT /image_uses/1" do
      params_from(:put, "/image_uses/1").should == {:controller => "image_uses", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'image_uses', action => 'destroy', id => '1' } from DELETE /image_uses/1" do
      params_from(:delete, "/image_uses/1").should == {:controller => "image_uses", :action => "destroy", :id => "1"}
    end
  end
end
