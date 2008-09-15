require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StocksController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "stocks", :action => "index").should == "/stocks"
    end
  
    it "should map #new" do
      route_for(:controller => "stocks", :action => "new").should == "/stocks/new"
    end
  
    it "should map #show" do
      route_for(:controller => "stocks", :action => "show", :id => 1).should == "/stocks/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "stocks", :action => "edit", :id => 1).should == "/stocks/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "stocks", :action => "update", :id => 1).should == "/stocks/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "stocks", :action => "destroy", :id => 1).should == "/stocks/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/stocks").should == {:controller => "stocks", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/stocks/new").should == {:controller => "stocks", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/stocks").should == {:controller => "stocks", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/stocks/1").should == {:controller => "stocks", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/stocks/1/edit").should == {:controller => "stocks", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/stocks/1").should == {:controller => "stocks", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/stocks/1").should == {:controller => "stocks", :action => "destroy", :id => "1"}
    end
  end
end
