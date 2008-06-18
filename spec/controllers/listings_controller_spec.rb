require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ListingsController do
  describe "handling GET /listings" do

    before(:each) do
      @listing = mock_model(Listing)
      Listing.stub!(:find).and_return([@listing])
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
  
    it "should find all listings" do
      Listing.should_receive(:find).with(:all).and_return([@listing])
      do_get
    end
  
    it "should assign the found listings for the view" do
      do_get
      assigns[:listings].should == [@listing]
    end
  end

  describe "handling GET /listings.xml" do

    before(:each) do
      @listings = mock("Array of Listings", :to_xml => "XML")
      Listing.stub!(:find).and_return(@listings)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all listings" do
      Listing.should_receive(:find).with(:all).and_return(@listings)
      do_get
    end
  
    it "should render the found listings as xml" do
      @listings.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /listings/1" do

    before(:each) do
      @listing = mock_model(Listing)
      Listing.stub!(:find).and_return(@listing)
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
  
    it "should find the listing requested" do
      Listing.should_receive(:find).with("1").and_return(@listing)
      do_get
    end
  
    it "should assign the found listing for the view" do
      do_get
      assigns[:listing].should equal(@listing)
    end
  end

  describe "handling GET /listings/1.xml" do

    before(:each) do
      @listing = mock_model(Listing, :to_xml => "XML")
      Listing.stub!(:find).and_return(@listing)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the listing requested" do
      Listing.should_receive(:find).with("1").and_return(@listing)
      do_get
    end
  
    it "should render the found listing as xml" do
      @listing.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /listings/new" do

    before(:each) do
      @listing = mock_model(Listing)
      Listing.stub!(:new).and_return(@listing)
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
  
    it "should create an new listing" do
      Listing.should_receive(:new).and_return(@listing)
      do_get
    end
  
    it "should not save the new listing" do
      @listing.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new listing for the view" do
      do_get
      assigns[:listing].should equal(@listing)
    end
  end

  describe "handling GET /listings/1/edit" do

    before(:each) do
      @listing = mock_model(Listing)
      Listing.stub!(:find).and_return(@listing)
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
  
    it "should find the listing requested" do
      Listing.should_receive(:find).and_return(@listing)
      do_get
    end
  
    it "should assign the found Listing for the view" do
      do_get
      assigns[:listing].should equal(@listing)
    end
  end

  describe "handling POST /listings" do

    before(:each) do
      @listing = mock_model(Listing, :to_param => "1")
      Listing.stub!(:new).and_return(@listing)
    end
    
    describe "with successful save" do
  
      def do_post
        @listing.should_receive(:save).and_return(true)
        post :create, :listing => {}
      end
  
      it "should create a new listing" do
        Listing.should_receive(:new).with({}).and_return(@listing)
        do_post
      end

      it "should redirect to the new listing" do
        do_post
        response.should redirect_to(listing_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @listing.should_receive(:save).and_return(false)
        post :create, :listing => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /listings/1" do

    before(:each) do
      @listing = mock_model(Listing, :to_param => "1")
      Listing.stub!(:find).and_return(@listing)
    end
    
    describe "with successful update" do

      def do_put
        @listing.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the listing requested" do
        Listing.should_receive(:find).with("1").and_return(@listing)
        do_put
      end

      it "should update the found listing" do
        do_put
        assigns(:listing).should equal(@listing)
      end

      it "should assign the found listing for the view" do
        do_put
        assigns(:listing).should equal(@listing)
      end

      it "should redirect to the listing" do
        do_put
        response.should redirect_to(listing_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @listing.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /listings/1" do

    before(:each) do
      @listing = mock_model(Listing, :destroy => true)
      Listing.stub!(:find).and_return(@listing)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the listing requested" do
      Listing.should_receive(:find).with("1").and_return(@listing)
      do_delete
    end
  
    it "should call destroy on the found listing" do
      @listing.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the listings list" do
      do_delete
      response.should redirect_to(listings_url)
    end
  end
end
