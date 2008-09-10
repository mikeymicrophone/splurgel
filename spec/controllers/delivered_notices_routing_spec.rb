require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DeliveredNoticesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "delivered_notices", :action => "index").should == "/delivered_notices"
    end
  
    it "should map #new" do
      route_for(:controller => "delivered_notices", :action => "new").should == "/delivered_notices/new"
    end
  
    it "should map #show" do
      route_for(:controller => "delivered_notices", :action => "show", :id => 1).should == "/delivered_notices/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "delivered_notices", :action => "edit", :id => 1).should == "/delivered_notices/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "delivered_notices", :action => "update", :id => 1).should == "/delivered_notices/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "delivered_notices", :action => "destroy", :id => 1).should == "/delivered_notices/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/delivered_notices").should == {:controller => "delivered_notices", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/delivered_notices/new").should == {:controller => "delivered_notices", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/delivered_notices").should == {:controller => "delivered_notices", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/delivered_notices/1").should == {:controller => "delivered_notices", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/delivered_notices/1/edit").should == {:controller => "delivered_notices", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/delivered_notices/1").should == {:controller => "delivered_notices", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/delivered_notices/1").should == {:controller => "delivered_notices", :action => "destroy", :id => "1"}
    end
  end
end
