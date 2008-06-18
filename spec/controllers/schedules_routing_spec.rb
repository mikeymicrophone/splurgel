require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SchedulesController do
  describe "route generation" do

    it "should map { :controller => 'schedules', :action => 'index' } to /schedules" do
      route_for(:controller => "schedules", :action => "index").should == "/schedules"
    end
  
    it "should map { :controller => 'schedules', :action => 'new' } to /schedules/new" do
      route_for(:controller => "schedules", :action => "new").should == "/schedules/new"
    end
  
    it "should map { :controller => 'schedules', :action => 'show', :id => 1 } to /schedules/1" do
      route_for(:controller => "schedules", :action => "show", :id => 1).should == "/schedules/1"
    end
  
    it "should map { :controller => 'schedules', :action => 'edit', :id => 1 } to /schedules/1/edit" do
      route_for(:controller => "schedules", :action => "edit", :id => 1).should == "/schedules/1/edit"
    end
  
    it "should map { :controller => 'schedules', :action => 'update', :id => 1} to /schedules/1" do
      route_for(:controller => "schedules", :action => "update", :id => 1).should == "/schedules/1"
    end
  
    it "should map { :controller => 'schedules', :action => 'destroy', :id => 1} to /schedules/1" do
      route_for(:controller => "schedules", :action => "destroy", :id => 1).should == "/schedules/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'schedules', action => 'index' } from GET /schedules" do
      params_from(:get, "/schedules").should == {:controller => "schedules", :action => "index"}
    end
  
    it "should generate params { :controller => 'schedules', action => 'new' } from GET /schedules/new" do
      params_from(:get, "/schedules/new").should == {:controller => "schedules", :action => "new"}
    end
  
    it "should generate params { :controller => 'schedules', action => 'create' } from POST /schedules" do
      params_from(:post, "/schedules").should == {:controller => "schedules", :action => "create"}
    end
  
    it "should generate params { :controller => 'schedules', action => 'show', id => '1' } from GET /schedules/1" do
      params_from(:get, "/schedules/1").should == {:controller => "schedules", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'schedules', action => 'edit', id => '1' } from GET /schedules/1;edit" do
      params_from(:get, "/schedules/1/edit").should == {:controller => "schedules", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'schedules', action => 'update', id => '1' } from PUT /schedules/1" do
      params_from(:put, "/schedules/1").should == {:controller => "schedules", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'schedules', action => 'destroy', id => '1' } from DELETE /schedules/1" do
      params_from(:delete, "/schedules/1").should == {:controller => "schedules", :action => "destroy", :id => "1"}
    end
  end
end
