require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AuthorizationsController do
  describe "handling GET /authorizations" do

    before(:each) do
      @authorization = mock_model(Authorization)
      Authorization.stub!(:find).and_return([@authorization])
    end
  
    def do_get
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end
  
    it "should find all authorizations" do
      Authorization.should_receive(:find).with(:all).and_return([@authorization])
      do_get
    end
  
    it "should assign the found authorizations for the view" do
      do_get
      assigns[:authorizations].should == [@authorization]
    end
  end

  describe "handling GET /authorizations.xml" do

    before(:each) do
      @authorizations = mock("Array of Authorizations", :to_xml => "XML")
      Authorization.stub!(:find).and_return(@authorizations)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all authorizations" do
      Authorization.should_receive(:find).with(:all).and_return(@authorizations)
      do_get
    end
  
    it "should render the found authorizations as xml" do
      @authorizations.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /authorizations/1" do

    before(:each) do
      @authorization = mock_model(Authorization)
      Authorization.stub!(:find).and_return(@authorization)
    end
  
    def do_get
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render show template" do
      do_get
      response.should render_template('show')
    end
  
    it "should find the authorization requested" do
      Authorization.should_receive(:find).with("1").and_return(@authorization)
      do_get
    end
  
    it "should assign the found authorization for the view" do
      do_get
      assigns[:authorization].should equal(@authorization)
    end
  end

  describe "handling GET /authorizations/1.xml" do

    before(:each) do
      @authorization = mock_model(Authorization, :to_xml => "XML")
      Authorization.stub!(:find).and_return(@authorization)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the authorization requested" do
      Authorization.should_receive(:find).with("1").and_return(@authorization)
      do_get
    end
  
    it "should render the found authorization as xml" do
      @authorization.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /authorizations/new" do

    before(:each) do
      @authorization = mock_model(Authorization)
      Authorization.stub!(:new).and_return(@authorization)
    end
  
    def do_get
      get :new
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render new template" do
      do_get
      response.should render_template('new')
    end
  
    it "should create an new authorization" do
      Authorization.should_receive(:new).and_return(@authorization)
      do_get
    end
  
    it "should not save the new authorization" do
      @authorization.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new authorization for the view" do
      do_get
      assigns[:authorization].should equal(@authorization)
    end
  end

  describe "handling GET /authorizations/1/edit" do

    before(:each) do
      @authorization = mock_model(Authorization)
      Authorization.stub!(:find).and_return(@authorization)
    end
  
    def do_get
      get :edit, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render edit template" do
      do_get
      response.should render_template('edit')
    end
  
    it "should find the authorization requested" do
      Authorization.should_receive(:find).and_return(@authorization)
      do_get
    end
  
    it "should assign the found Authorization for the view" do
      do_get
      assigns[:authorization].should equal(@authorization)
    end
  end

  describe "handling POST /authorizations" do

    before(:each) do
      @authorization = mock_model(Authorization, :to_param => "1")
      Authorization.stub!(:new).and_return(@authorization)
    end
    
    describe "with successful save" do
  
      def do_post
        @authorization.should_receive(:save).and_return(true)
        post :create, :authorization => {}
      end
  
      it "should create a new authorization" do
        Authorization.should_receive(:new).with({}).and_return(@authorization)
        do_post
      end

      it "should redirect to the new authorization" do
        do_post
        response.should redirect_to(authorization_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @authorization.should_receive(:save).and_return(false)
        post :create, :authorization => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /authorizations/1" do

    before(:each) do
      @authorization = mock_model(Authorization, :to_param => "1")
      Authorization.stub!(:find).and_return(@authorization)
    end
    
    describe "with successful update" do

      def do_put
        @authorization.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the authorization requested" do
        Authorization.should_receive(:find).with("1").and_return(@authorization)
        do_put
      end

      it "should update the found authorization" do
        do_put
        assigns(:authorization).should equal(@authorization)
      end

      it "should assign the found authorization for the view" do
        do_put
        assigns(:authorization).should equal(@authorization)
      end

      it "should redirect to the authorization" do
        do_put
        response.should redirect_to(authorization_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @authorization.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /authorizations/1" do

    before(:each) do
      @authorization = mock_model(Authorization, :destroy => true)
      Authorization.stub!(:find).and_return(@authorization)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the authorization requested" do
      Authorization.should_receive(:find).with("1").and_return(@authorization)
      do_delete
    end
  
    it "should call destroy on the found authorization" do
      @authorization.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the authorizations list" do
      do_delete
      response.should redirect_to(authorizations_url)
    end
  end
end
