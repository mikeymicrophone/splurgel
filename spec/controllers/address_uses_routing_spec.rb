require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AddressUsesController do
  describe "route generation" do

    it "should map { :controller => 'address_uses', :action => 'index' } to /address_uses" do
      route_for(:controller => "address_uses", :action => "index").should == "/address_uses"
    end
  
    it "should map { :controller => 'address_uses', :action => 'new' } to /address_uses/new" do
      route_for(:controller => "address_uses", :action => "new").should == "/address_uses/new"
    end
  
    it "should map { :controller => 'address_uses', :action => 'show', :id => 1 } to /address_uses/1" do
      route_for(:controller => "address_uses", :action => "show", :id => 1).should == "/address_uses/1"
    end
  
    it "should map { :controller => 'address_uses', :action => 'edit', :id => 1 } to /address_uses/1/edit" do
      route_for(:controller => "address_uses", :action => "edit", :id => 1).should == "/address_uses/1/edit"
    end
  
    it "should map { :controller => 'address_uses', :action => 'update', :id => 1} to /address_uses/1" do
      route_for(:controller => "address_uses", :action => "update", :id => 1).should == "/address_uses/1"
    end
  
    it "should map { :controller => 'address_uses', :action => 'destroy', :id => 1} to /address_uses/1" do
      route_for(:controller => "address_uses", :action => "destroy", :id => 1).should == "/address_uses/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'address_uses', action => 'index' } from GET /address_uses" do
      params_from(:get, "/address_uses").should == {:controller => "address_uses", :action => "index"}
    end
  
    it "should generate params { :controller => 'address_uses', action => 'new' } from GET /address_uses/new" do
      params_from(:get, "/address_uses/new").should == {:controller => "address_uses", :action => "new"}
    end
  
    it "should generate params { :controller => 'address_uses', action => 'create' } from POST /address_uses" do
      params_from(:post, "/address_uses").should == {:controller => "address_uses", :action => "create"}
    end
  
    it "should generate params { :controller => 'address_uses', action => 'show', id => '1' } from GET /address_uses/1" do
      params_from(:get, "/address_uses/1").should == {:controller => "address_uses", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'address_uses', action => 'edit', id => '1' } from GET /address_uses/1;edit" do
      params_from(:get, "/address_uses/1/edit").should == {:controller => "address_uses", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'address_uses', action => 'update', id => '1' } from PUT /address_uses/1" do
      params_from(:put, "/address_uses/1").should == {:controller => "address_uses", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'address_uses', action => 'destroy', id => '1' } from DELETE /address_uses/1" do
      params_from(:delete, "/address_uses/1").should == {:controller => "address_uses", :action => "destroy", :id => "1"}
    end
  end
end
