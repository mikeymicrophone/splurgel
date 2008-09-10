require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NoticesController do

  def mock_notice(stubs={})
    @mock_notice ||= mock_model(Notice, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all notices as @notices" do
      Notice.should_receive(:find).with(:all).and_return([mock_notice])
      get :index
      assigns[:notices].should == [mock_notice]
    end

    describe "with mime type of xml" do
  
      it "should render all notices as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Notice.should_receive(:find).with(:all).and_return(notices = mock("Array of Notices"))
        notices.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested notice as @notice" do
      Notice.should_receive(:find).with("37").and_return(mock_notice)
      get :show, :id => "37"
      assigns[:notice].should equal(mock_notice)
    end
    
    describe "with mime type of xml" do

      it "should render the requested notice as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Notice.should_receive(:find).with("37").and_return(mock_notice)
        mock_notice.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new notice as @notice" do
      Notice.should_receive(:new).and_return(mock_notice)
      get :new
      assigns[:notice].should equal(mock_notice)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested notice as @notice" do
      Notice.should_receive(:find).with("37").and_return(mock_notice)
      get :edit, :id => "37"
      assigns[:notice].should equal(mock_notice)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created notice as @notice" do
        Notice.should_receive(:new).with({'these' => 'params'}).and_return(mock_notice(:save => true))
        post :create, :notice => {:these => 'params'}
        assigns(:notice).should equal(mock_notice)
      end

      it "should redirect to the created notice" do
        Notice.stub!(:new).and_return(mock_notice(:save => true))
        post :create, :notice => {}
        response.should redirect_to(notice_url(mock_notice))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved notice as @notice" do
        Notice.stub!(:new).with({'these' => 'params'}).and_return(mock_notice(:save => false))
        post :create, :notice => {:these => 'params'}
        assigns(:notice).should equal(mock_notice)
      end

      it "should re-render the 'new' template" do
        Notice.stub!(:new).and_return(mock_notice(:save => false))
        post :create, :notice => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested notice" do
        Notice.should_receive(:find).with("37").and_return(mock_notice)
        mock_notice.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :notice => {:these => 'params'}
      end

      it "should expose the requested notice as @notice" do
        Notice.stub!(:find).and_return(mock_notice(:update_attributes => true))
        put :update, :id => "1"
        assigns(:notice).should equal(mock_notice)
      end

      it "should redirect to the notice" do
        Notice.stub!(:find).and_return(mock_notice(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(notice_url(mock_notice))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested notice" do
        Notice.should_receive(:find).with("37").and_return(mock_notice)
        mock_notice.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :notice => {:these => 'params'}
      end

      it "should expose the notice as @notice" do
        Notice.stub!(:find).and_return(mock_notice(:update_attributes => false))
        put :update, :id => "1"
        assigns(:notice).should equal(mock_notice)
      end

      it "should re-render the 'edit' template" do
        Notice.stub!(:find).and_return(mock_notice(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested notice" do
      Notice.should_receive(:find).with("37").and_return(mock_notice)
      mock_notice.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the notices list" do
      Notice.stub!(:find).and_return(mock_notice(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(notices_url)
    end

  end

end
