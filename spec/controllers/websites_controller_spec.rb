require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WebsitesController do
  describe "handling GET /websites" do

    before(:each) do
      @website = mock_model(Website)
      Website.stub!(:find).and_return([@website])
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
  
    it "should find all websites" do
      Website.should_receive(:find).with(:all).and_return([@website])
      do_get
    end
  
    it "should assign the found websites for the view" do
      do_get
      assigns[:websites].should == [@website]
    end
  end

  describe "handling GET /websites.xml" do

    before(:each) do
      @websites = mock("Array of Websites", :to_xml => "XML")
      Website.stub!(:find).and_return(@websites)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all websites" do
      Website.should_receive(:find).with(:all).and_return(@websites)
      do_get
    end
  
    it "should render the found websites as xml" do
      @websites.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /websites/1" do

    before(:each) do
      @website = mock_model(Website)
      Website.stub!(:find).and_return(@website)
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
  
    it "should find the website requested" do
      Website.should_receive(:find).with("1").and_return(@website)
      do_get
    end
  
    it "should assign the found website for the view" do
      do_get
      assigns[:website].should equal(@website)
    end
  end

  describe "handling GET /websites/1.xml" do

    before(:each) do
      @website = mock_model(Website, :to_xml => "XML")
      Website.stub!(:find).and_return(@website)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the website requested" do
      Website.should_receive(:find).with("1").and_return(@website)
      do_get
    end
  
    it "should render the found website as xml" do
      @website.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /websites/new" do

    before(:each) do
      @website = mock_model(Website)
      Website.stub!(:new).and_return(@website)
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
  
    it "should create an new website" do
      Website.should_receive(:new).and_return(@website)
      do_get
    end
  
    it "should not save the new website" do
      @website.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new website for the view" do
      do_get
      assigns[:website].should equal(@website)
    end
  end

  describe "handling GET /websites/1/edit" do

    before(:each) do
      @website = mock_model(Website)
      Website.stub!(:find).and_return(@website)
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
  
    it "should find the website requested" do
      Website.should_receive(:find).and_return(@website)
      do_get
    end
  
    it "should assign the found Website for the view" do
      do_get
      assigns[:website].should equal(@website)
    end
  end

  describe "handling POST /websites" do

    before(:each) do
      @website = mock_model(Website, :to_param => "1")
      Website.stub!(:new).and_return(@website)
    end
    
    describe "with successful save" do
  
      def do_post
        @website.should_receive(:save).and_return(true)
        post :create, :website => {}
      end
  
      it "should create a new website" do
        Website.should_receive(:new).with({}).and_return(@website)
        do_post
      end

      it "should redirect to the new website" do
        do_post
        response.should redirect_to(website_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @website.should_receive(:save).and_return(false)
        post :create, :website => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /websites/1" do

    before(:each) do
      @website = mock_model(Website, :to_param => "1")
      Website.stub!(:find).and_return(@website)
    end
    
    describe "with successful update" do

      def do_put
        @website.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the website requested" do
        Website.should_receive(:find).with("1").and_return(@website)
        do_put
      end

      it "should update the found website" do
        do_put
        assigns(:website).should equal(@website)
      end

      it "should assign the found website for the view" do
        do_put
        assigns(:website).should equal(@website)
      end

      it "should redirect to the website" do
        do_put
        response.should redirect_to(website_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @website.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /websites/1" do

    before(:each) do
      @website = mock_model(Website, :destroy => true)
      Website.stub!(:find).and_return(@website)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the website requested" do
      Website.should_receive(:find).with("1").and_return(@website)
      do_delete
    end
  
    it "should call destroy on the found website" do
      @website.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the websites list" do
      do_delete
      response.should redirect_to(websites_url)
    end
  end
end
