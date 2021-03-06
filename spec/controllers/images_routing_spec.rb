require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ImagesController do
  describe "route generation" do

    it "should map { :controller => 'images', :action => 'index' } to /images" do
      route_for(:controller => "images", :action => "index").should == "/images"
    end
  
    it "should map { :controller => 'images', :action => 'new' } to /images/new" do
      route_for(:controller => "images", :action => "new").should == "/images/new"
    end
  
    it "should map { :controller => 'images', :action => 'show', :id => 1 } to /images/1" do
      route_for(:controller => "images", :action => "show", :id => 1).should == "/images/1"
    end
  
    it "should map { :controller => 'images', :action => 'edit', :id => 1 } to /images/1/edit" do
      route_for(:controller => "images", :action => "edit", :id => 1).should == "/images/1/edit"
    end
  
    it "should map { :controller => 'images', :action => 'update', :id => 1} to /images/1" do
      route_for(:controller => "images", :action => "update", :id => 1).should == "/images/1"
    end
  
    it "should map { :controller => 'images', :action => 'destroy', :id => 1} to /images/1" do
      route_for(:controller => "images", :action => "destroy", :id => 1).should == "/images/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'images', action => 'index' } from GET /images" do
      params_from(:get, "/images").should == {:controller => "images", :action => "index"}
    end
  
    it "should generate params { :controller => 'images', action => 'new' } from GET /images/new" do
      params_from(:get, "/images/new").should == {:controller => "images", :action => "new"}
    end
  
    it "should generate params { :controller => 'images', action => 'create' } from POST /images" do
      params_from(:post, "/images").should == {:controller => "images", :action => "create"}
    end
  
    it "should generate params { :controller => 'images', action => 'show', id => '1' } from GET /images/1" do
      params_from(:get, "/images/1").should == {:controller => "images", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'images', action => 'edit', id => '1' } from GET /images/1;edit" do
      params_from(:get, "/images/1/edit").should == {:controller => "images", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'images', action => 'update', id => '1' } from PUT /images/1" do
      params_from(:put, "/images/1").should == {:controller => "images", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'images', action => 'destroy', id => '1' } from DELETE /images/1" do
      params_from(:delete, "/images/1").should == {:controller => "images", :action => "destroy", :id => "1"}
    end
  end
end
