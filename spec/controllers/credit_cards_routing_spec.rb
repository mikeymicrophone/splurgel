require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CreditCardsController do
  describe "route generation" do

    it "should map { :controller => 'credit_cards', :action => 'index' } to /credit_cards" do
      route_for(:controller => "credit_cards", :action => "index").should == "/credit_cards"
    end
  
    it "should map { :controller => 'credit_cards', :action => 'new' } to /credit_cards/new" do
      route_for(:controller => "credit_cards", :action => "new").should == "/credit_cards/new"
    end
  
    it "should map { :controller => 'credit_cards', :action => 'show', :id => 1 } to /credit_cards/1" do
      route_for(:controller => "credit_cards", :action => "show", :id => 1).should == "/credit_cards/1"
    end
  
    it "should map { :controller => 'credit_cards', :action => 'edit', :id => 1 } to /credit_cards/1/edit" do
      route_for(:controller => "credit_cards", :action => "edit", :id => 1).should == "/credit_cards/1/edit"
    end
  
    it "should map { :controller => 'credit_cards', :action => 'update', :id => 1} to /credit_cards/1" do
      route_for(:controller => "credit_cards", :action => "update", :id => 1).should == "/credit_cards/1"
    end
  
    it "should map { :controller => 'credit_cards', :action => 'destroy', :id => 1} to /credit_cards/1" do
      route_for(:controller => "credit_cards", :action => "destroy", :id => 1).should == "/credit_cards/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'credit_cards', action => 'index' } from GET /credit_cards" do
      params_from(:get, "/credit_cards").should == {:controller => "credit_cards", :action => "index"}
    end
  
    it "should generate params { :controller => 'credit_cards', action => 'new' } from GET /credit_cards/new" do
      params_from(:get, "/credit_cards/new").should == {:controller => "credit_cards", :action => "new"}
    end
  
    it "should generate params { :controller => 'credit_cards', action => 'create' } from POST /credit_cards" do
      params_from(:post, "/credit_cards").should == {:controller => "credit_cards", :action => "create"}
    end
  
    it "should generate params { :controller => 'credit_cards', action => 'show', id => '1' } from GET /credit_cards/1" do
      params_from(:get, "/credit_cards/1").should == {:controller => "credit_cards", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'credit_cards', action => 'edit', id => '1' } from GET /credit_cards/1;edit" do
      params_from(:get, "/credit_cards/1/edit").should == {:controller => "credit_cards", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'credit_cards', action => 'update', id => '1' } from PUT /credit_cards/1" do
      params_from(:put, "/credit_cards/1").should == {:controller => "credit_cards", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'credit_cards', action => 'destroy', id => '1' } from DELETE /credit_cards/1" do
      params_from(:delete, "/credit_cards/1").should == {:controller => "credit_cards", :action => "destroy", :id => "1"}
    end
  end
end
