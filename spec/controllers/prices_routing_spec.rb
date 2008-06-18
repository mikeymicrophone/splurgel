require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PricesController do
  describe "route generation" do

    it "should map { :controller => 'prices', :action => 'index' } to /prices" do
      route_for(:controller => "prices", :action => "index").should == "/prices"
    end
  
    it "should map { :controller => 'prices', :action => 'new' } to /prices/new" do
      route_for(:controller => "prices", :action => "new").should == "/prices/new"
    end
  
    it "should map { :controller => 'prices', :action => 'show', :id => 1 } to /prices/1" do
      route_for(:controller => "prices", :action => "show", :id => 1).should == "/prices/1"
    end
  
    it "should map { :controller => 'prices', :action => 'edit', :id => 1 } to /prices/1/edit" do
      route_for(:controller => "prices", :action => "edit", :id => 1).should == "/prices/1/edit"
    end
  
    it "should map { :controller => 'prices', :action => 'update', :id => 1} to /prices/1" do
      route_for(:controller => "prices", :action => "update", :id => 1).should == "/prices/1"
    end
  
    it "should map { :controller => 'prices', :action => 'destroy', :id => 1} to /prices/1" do
      route_for(:controller => "prices", :action => "destroy", :id => 1).should == "/prices/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'prices', action => 'index' } from GET /prices" do
      params_from(:get, "/prices").should == {:controller => "prices", :action => "index"}
    end
  
    it "should generate params { :controller => 'prices', action => 'new' } from GET /prices/new" do
      params_from(:get, "/prices/new").should == {:controller => "prices", :action => "new"}
    end
  
    it "should generate params { :controller => 'prices', action => 'create' } from POST /prices" do
      params_from(:post, "/prices").should == {:controller => "prices", :action => "create"}
    end
  
    it "should generate params { :controller => 'prices', action => 'show', id => '1' } from GET /prices/1" do
      params_from(:get, "/prices/1").should == {:controller => "prices", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'prices', action => 'edit', id => '1' } from GET /prices/1;edit" do
      params_from(:get, "/prices/1/edit").should == {:controller => "prices", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'prices', action => 'update', id => '1' } from PUT /prices/1" do
      params_from(:put, "/prices/1").should == {:controller => "prices", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'prices', action => 'destroy', id => '1' } from DELETE /prices/1" do
      params_from(:delete, "/prices/1").should == {:controller => "prices", :action => "destroy", :id => "1"}
    end
  end
end
