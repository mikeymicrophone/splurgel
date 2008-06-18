require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OfferingsController do
  describe "handling GET /offerings" do

    before(:each) do
      @offering = mock_model(Offering)
      Offering.stub!(:find).and_return([@offering])
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
  
    it "should find all offerings" do
      Offering.should_receive(:find).with(:all).and_return([@offering])
      do_get
    end
  
    it "should assign the found offerings for the view" do
      do_get
      assigns[:offerings].should == [@offering]
    end
  end

  describe "handling GET /offerings.xml" do

    before(:each) do
      @offerings = mock("Array of Offerings", :to_xml => "XML")
      Offering.stub!(:find).and_return(@offerings)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all offerings" do
      Offering.should_receive(:find).with(:all).and_return(@offerings)
      do_get
    end
  
    it "should render the found offerings as xml" do
      @offerings.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /offerings/1" do

    before(:each) do
      @offering = mock_model(Offering)
      Offering.stub!(:find).and_return(@offering)
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
  
    it "should find the offering requested" do
      Offering.should_receive(:find).with("1").and_return(@offering)
      do_get
    end
  
    it "should assign the found offering for the view" do
      do_get
      assigns[:offering].should equal(@offering)
    end
  end

  describe "handling GET /offerings/1.xml" do

    before(:each) do
      @offering = mock_model(Offering, :to_xml => "XML")
      Offering.stub!(:find).and_return(@offering)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the offering requested" do
      Offering.should_receive(:find).with("1").and_return(@offering)
      do_get
    end
  
    it "should render the found offering as xml" do
      @offering.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /offerings/new" do

    before(:each) do
      @offering = mock_model(Offering)
      Offering.stub!(:new).and_return(@offering)
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
  
    it "should create an new offering" do
      Offering.should_receive(:new).and_return(@offering)
      do_get
    end
  
    it "should not save the new offering" do
      @offering.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new offering for the view" do
      do_get
      assigns[:offering].should equal(@offering)
    end
  end

  describe "handling GET /offerings/1/edit" do

    before(:each) do
      @offering = mock_model(Offering)
      Offering.stub!(:find).and_return(@offering)
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
  
    it "should find the offering requested" do
      Offering.should_receive(:find).and_return(@offering)
      do_get
    end
  
    it "should assign the found Offering for the view" do
      do_get
      assigns[:offering].should equal(@offering)
    end
  end

  describe "handling POST /offerings" do

    before(:each) do
      @offering = mock_model(Offering, :to_param => "1")
      Offering.stub!(:new).and_return(@offering)
    end
    
    describe "with successful save" do
  
      def do_post
        @offering.should_receive(:save).and_return(true)
        post :create, :offering => {}
      end
  
      it "should create a new offering" do
        Offering.should_receive(:new).with({}).and_return(@offering)
        do_post
      end

      it "should redirect to the new offering" do
        do_post
        response.should redirect_to(offering_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @offering.should_receive(:save).and_return(false)
        post :create, :offering => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /offerings/1" do

    before(:each) do
      @offering = mock_model(Offering, :to_param => "1")
      Offering.stub!(:find).and_return(@offering)
    end
    
    describe "with successful update" do

      def do_put
        @offering.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the offering requested" do
        Offering.should_receive(:find).with("1").and_return(@offering)
        do_put
      end

      it "should update the found offering" do
        do_put
        assigns(:offering).should equal(@offering)
      end

      it "should assign the found offering for the view" do
        do_put
        assigns(:offering).should equal(@offering)
      end

      it "should redirect to the offering" do
        do_put
        response.should redirect_to(offering_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @offering.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /offerings/1" do

    before(:each) do
      @offering = mock_model(Offering, :destroy => true)
      Offering.stub!(:find).and_return(@offering)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the offering requested" do
      Offering.should_receive(:find).with("1").and_return(@offering)
      do_delete
    end
  
    it "should call destroy on the found offering" do
      @offering.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the offerings list" do
      do_delete
      response.should redirect_to(offerings_url)
    end
  end
end
