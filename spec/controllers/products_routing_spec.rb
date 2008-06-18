require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProductsController do
  describe "route generation" do

    it "should map { :controller => 'products', :action => 'index' } to /products" do
      route_for(:controller => "products", :action => "index").should == "/products"
    end
  
    it "should map { :controller => 'products', :action => 'new' } to /products/new" do
      route_for(:controller => "products", :action => "new").should == "/products/new"
    end
  
    it "should map { :controller => 'products', :action => 'show', :id => 1 } to /products/1" do
      route_for(:controller => "products", :action => "show", :id => 1).should == "/products/1"
    end
  
    it "should map { :controller => 'products', :action => 'edit', :id => 1 } to /products/1/edit" do
      route_for(:controller => "products", :action => "edit", :id => 1).should == "/products/1/edit"
    end
  
    it "should map { :controller => 'products', :action => 'update', :id => 1} to /products/1" do
      route_for(:controller => "products", :action => "update", :id => 1).should == "/products/1"
    end
  
    it "should map { :controller => 'products', :action => 'destroy', :id => 1} to /products/1" do
      route_for(:controller => "products", :action => "destroy", :id => 1).should == "/products/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'products', action => 'index' } from GET /products" do
      params_from(:get, "/products").should == {:controller => "products", :action => "index"}
    end
  
    it "should generate params { :controller => 'products', action => 'new' } from GET /products/new" do
      params_from(:get, "/products/new").should == {:controller => "products", :action => "new"}
    end
  
    it "should generate params { :controller => 'products', action => 'create' } from POST /products" do
      params_from(:post, "/products").should == {:controller => "products", :action => "create"}
    end
  
    it "should generate params { :controller => 'products', action => 'show', id => '1' } from GET /products/1" do
      params_from(:get, "/products/1").should == {:controller => "products", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'products', action => 'edit', id => '1' } from GET /products/1;edit" do
      params_from(:get, "/products/1/edit").should == {:controller => "products", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'products', action => 'update', id => '1' } from PUT /products/1" do
      params_from(:put, "/products/1").should == {:controller => "products", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'products', action => 'destroy', id => '1' } from DELETE /products/1" do
      params_from(:delete, "/products/1").should == {:controller => "products", :action => "destroy", :id => "1"}
    end
  end
end
