require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PhoneUsesController do
  describe "route generation" do

    it "should map { :controller => 'phone_uses', :action => 'index' } to /phone_uses" do
      route_for(:controller => "phone_uses", :action => "index").should == "/phone_uses"
    end
  
    it "should map { :controller => 'phone_uses', :action => 'new' } to /phone_uses/new" do
      route_for(:controller => "phone_uses", :action => "new").should == "/phone_uses/new"
    end
  
    it "should map { :controller => 'phone_uses', :action => 'show', :id => 1 } to /phone_uses/1" do
      route_for(:controller => "phone_uses", :action => "show", :id => 1).should == "/phone_uses/1"
    end
  
    it "should map { :controller => 'phone_uses', :action => 'edit', :id => 1 } to /phone_uses/1/edit" do
      route_for(:controller => "phone_uses", :action => "edit", :id => 1).should == "/phone_uses/1/edit"
    end
  
    it "should map { :controller => 'phone_uses', :action => 'update', :id => 1} to /phone_uses/1" do
      route_for(:controller => "phone_uses", :action => "update", :id => 1).should == "/phone_uses/1"
    end
  
    it "should map { :controller => 'phone_uses', :action => 'destroy', :id => 1} to /phone_uses/1" do
      route_for(:controller => "phone_uses", :action => "destroy", :id => 1).should == "/phone_uses/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'phone_uses', action => 'index' } from GET /phone_uses" do
      params_from(:get, "/phone_uses").should == {:controller => "phone_uses", :action => "index"}
    end
  
    it "should generate params { :controller => 'phone_uses', action => 'new' } from GET /phone_uses/new" do
      params_from(:get, "/phone_uses/new").should == {:controller => "phone_uses", :action => "new"}
    end
  
    it "should generate params { :controller => 'phone_uses', action => 'create' } from POST /phone_uses" do
      params_from(:post, "/phone_uses").should == {:controller => "phone_uses", :action => "create"}
    end
  
    it "should generate params { :controller => 'phone_uses', action => 'show', id => '1' } from GET /phone_uses/1" do
      params_from(:get, "/phone_uses/1").should == {:controller => "phone_uses", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'phone_uses', action => 'edit', id => '1' } from GET /phone_uses/1;edit" do
      params_from(:get, "/phone_uses/1/edit").should == {:controller => "phone_uses", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'phone_uses', action => 'update', id => '1' } from PUT /phone_uses/1" do
      params_from(:put, "/phone_uses/1").should == {:controller => "phone_uses", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'phone_uses', action => 'destroy', id => '1' } from DELETE /phone_uses/1" do
      params_from(:delete, "/phone_uses/1").should == {:controller => "phone_uses", :action => "destroy", :id => "1"}
    end
  end
end
