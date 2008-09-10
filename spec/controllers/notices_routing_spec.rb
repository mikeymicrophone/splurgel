require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NoticesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "notices", :action => "index").should == "/notices"
    end
  
    it "should map #new" do
      route_for(:controller => "notices", :action => "new").should == "/notices/new"
    end
  
    it "should map #show" do
      route_for(:controller => "notices", :action => "show", :id => 1).should == "/notices/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "notices", :action => "edit", :id => 1).should == "/notices/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "notices", :action => "update", :id => 1).should == "/notices/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "notices", :action => "destroy", :id => 1).should == "/notices/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/notices").should == {:controller => "notices", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/notices/new").should == {:controller => "notices", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/notices").should == {:controller => "notices", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/notices/1").should == {:controller => "notices", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/notices/1/edit").should == {:controller => "notices", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/notices/1").should == {:controller => "notices", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/notices/1").should == {:controller => "notices", :action => "destroy", :id => "1"}
    end
  end
end
