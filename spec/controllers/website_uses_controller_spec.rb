require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WebsiteUsesController do
  describe "handling GET /website_uses" do

    before(:each) do
      @website_use = mock_model(WebsiteUse)
      WebsiteUse.stub!(:find).and_return([@website_use])
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
  
    it "should find all website_uses" do
      WebsiteUse.should_receive(:find).with(:all).and_return([@website_use])
      do_get
    end
  
    it "should assign the found website_uses for the view" do
      do_get
      assigns[:website_uses].should == [@website_use]
    end
  end

  describe "handling GET /website_uses.xml" do

    before(:each) do
      @website_uses = mock("Array of WebsiteUses", :to_xml => "XML")
      WebsiteUse.stub!(:find).and_return(@website_uses)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all website_uses" do
      WebsiteUse.should_receive(:find).with(:all).and_return(@website_uses)
      do_get
    end
  
    it "should render the found website_uses as xml" do
      @website_uses.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /website_uses/1" do

    before(:each) do
      @website_use = mock_model(WebsiteUse)
      WebsiteUse.stub!(:find).and_return(@website_use)
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
  
    it "should find the website_use requested" do
      WebsiteUse.should_receive(:find).with("1").and_return(@website_use)
      do_get
    end
  
    it "should assign the found website_use for the view" do
      do_get
      assigns[:website_use].should equal(@website_use)
    end
  end

  describe "handling GET /website_uses/1.xml" do

    before(:each) do
      @website_use = mock_model(WebsiteUse, :to_xml => "XML")
      WebsiteUse.stub!(:find).and_return(@website_use)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the website_use requested" do
      WebsiteUse.should_receive(:find).with("1").and_return(@website_use)
      do_get
    end
  
    it "should render the found website_use as xml" do
      @website_use.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /website_uses/new" do

    before(:each) do
      @website_use = mock_model(WebsiteUse)
      WebsiteUse.stub!(:new).and_return(@website_use)
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
  
    it "should create an new website_use" do
      WebsiteUse.should_receive(:new).and_return(@website_use)
      do_get
    end
  
    it "should not save the new website_use" do
      @website_use.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new website_use for the view" do
      do_get
      assigns[:website_use].should equal(@website_use)
    end
  end

  describe "handling GET /website_uses/1/edit" do

    before(:each) do
      @website_use = mock_model(WebsiteUse)
      WebsiteUse.stub!(:find).and_return(@website_use)
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
  
    it "should find the website_use requested" do
      WebsiteUse.should_receive(:find).and_return(@website_use)
      do_get
    end
  
    it "should assign the found WebsiteUse for the view" do
      do_get
      assigns[:website_use].should equal(@website_use)
    end
  end

  describe "handling POST /website_uses" do

    before(:each) do
      @website_use = mock_model(WebsiteUse, :to_param => "1")
      WebsiteUse.stub!(:new).and_return(@website_use)
    end
    
    describe "with successful save" do
  
      def do_post
        @website_use.should_receive(:save).and_return(true)
        post :create, :website_use => {}
      end
  
      it "should create a new website_use" do
        WebsiteUse.should_receive(:new).with({}).and_return(@website_use)
        do_post
      end

      it "should redirect to the new website_use" do
        do_post
        response.should redirect_to(website_use_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @website_use.should_receive(:save).and_return(false)
        post :create, :website_use => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /website_uses/1" do

    before(:each) do
      @website_use = mock_model(WebsiteUse, :to_param => "1")
      WebsiteUse.stub!(:find).and_return(@website_use)
    end
    
    describe "with successful update" do

      def do_put
        @website_use.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the website_use requested" do
        WebsiteUse.should_receive(:find).with("1").and_return(@website_use)
        do_put
      end

      it "should update the found website_use" do
        do_put
        assigns(:website_use).should equal(@website_use)
      end

      it "should assign the found website_use for the view" do
        do_put
        assigns(:website_use).should equal(@website_use)
      end

      it "should redirect to the website_use" do
        do_put
        response.should redirect_to(website_use_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @website_use.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /website_uses/1" do

    before(:each) do
      @website_use = mock_model(WebsiteUse, :destroy => true)
      WebsiteUse.stub!(:find).and_return(@website_use)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the website_use requested" do
      WebsiteUse.should_receive(:find).with("1").and_return(@website_use)
      do_delete
    end
  
    it "should call destroy on the found website_use" do
      @website_use.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the website_uses list" do
      do_delete
      response.should redirect_to(website_uses_url)
    end
  end
end
