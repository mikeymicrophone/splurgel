require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DeliveredNoticesController do

  def mock_delivered_notice(stubs={})
    @mock_delivered_notice ||= mock_model(DeliveredNotice, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all delivered_notices as @delivered_notices" do
      DeliveredNotice.should_receive(:find).with(:all).and_return([mock_delivered_notice])
      get :index
      assigns[:delivered_notices].should == [mock_delivered_notice]
    end

    describe "with mime type of xml" do
  
      it "should render all delivered_notices as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        DeliveredNotice.should_receive(:find).with(:all).and_return(delivered_notices = mock("Array of DeliveredNotices"))
        delivered_notices.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested delivered_notice as @delivered_notice" do
      DeliveredNotice.should_receive(:find).with("37").and_return(mock_delivered_notice)
      get :show, :id => "37"
      assigns[:delivered_notice].should equal(mock_delivered_notice)
    end
    
    describe "with mime type of xml" do

      it "should render the requested delivered_notice as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        DeliveredNotice.should_receive(:find).with("37").and_return(mock_delivered_notice)
        mock_delivered_notice.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new delivered_notice as @delivered_notice" do
      DeliveredNotice.should_receive(:new).and_return(mock_delivered_notice)
      get :new
      assigns[:delivered_notice].should equal(mock_delivered_notice)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested delivered_notice as @delivered_notice" do
      DeliveredNotice.should_receive(:find).with("37").and_return(mock_delivered_notice)
      get :edit, :id => "37"
      assigns[:delivered_notice].should equal(mock_delivered_notice)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created delivered_notice as @delivered_notice" do
        DeliveredNotice.should_receive(:new).with({'these' => 'params'}).and_return(mock_delivered_notice(:save => true))
        post :create, :delivered_notice => {:these => 'params'}
        assigns(:delivered_notice).should equal(mock_delivered_notice)
      end

      it "should redirect to the created delivered_notice" do
        DeliveredNotice.stub!(:new).and_return(mock_delivered_notice(:save => true))
        post :create, :delivered_notice => {}
        response.should redirect_to(delivered_notice_url(mock_delivered_notice))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved delivered_notice as @delivered_notice" do
        DeliveredNotice.stub!(:new).with({'these' => 'params'}).and_return(mock_delivered_notice(:save => false))
        post :create, :delivered_notice => {:these => 'params'}
        assigns(:delivered_notice).should equal(mock_delivered_notice)
      end

      it "should re-render the 'new' template" do
        DeliveredNotice.stub!(:new).and_return(mock_delivered_notice(:save => false))
        post :create, :delivered_notice => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested delivered_notice" do
        DeliveredNotice.should_receive(:find).with("37").and_return(mock_delivered_notice)
        mock_delivered_notice.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :delivered_notice => {:these => 'params'}
      end

      it "should expose the requested delivered_notice as @delivered_notice" do
        DeliveredNotice.stub!(:find).and_return(mock_delivered_notice(:update_attributes => true))
        put :update, :id => "1"
        assigns(:delivered_notice).should equal(mock_delivered_notice)
      end

      it "should redirect to the delivered_notice" do
        DeliveredNotice.stub!(:find).and_return(mock_delivered_notice(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(delivered_notice_url(mock_delivered_notice))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested delivered_notice" do
        DeliveredNotice.should_receive(:find).with("37").and_return(mock_delivered_notice)
        mock_delivered_notice.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :delivered_notice => {:these => 'params'}
      end

      it "should expose the delivered_notice as @delivered_notice" do
        DeliveredNotice.stub!(:find).and_return(mock_delivered_notice(:update_attributes => false))
        put :update, :id => "1"
        assigns(:delivered_notice).should equal(mock_delivered_notice)
      end

      it "should re-render the 'edit' template" do
        DeliveredNotice.stub!(:find).and_return(mock_delivered_notice(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested delivered_notice" do
      DeliveredNotice.should_receive(:find).with("37").and_return(mock_delivered_notice)
      mock_delivered_notice.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the delivered_notices list" do
      DeliveredNotice.stub!(:find).and_return(mock_delivered_notice(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(delivered_notices_url)
    end

  end

end
