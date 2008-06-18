require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PricesController do
  describe "handling GET /prices" do

    before(:each) do
      @price = mock_model(Price)
      Price.stub!(:find).and_return([@price])
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
  
    it "should find all prices" do
      Price.should_receive(:find).with(:all).and_return([@price])
      do_get
    end
  
    it "should assign the found prices for the view" do
      do_get
      assigns[:prices].should == [@price]
    end
  end

  describe "handling GET /prices.xml" do

    before(:each) do
      @prices = mock("Array of Prices", :to_xml => "XML")
      Price.stub!(:find).and_return(@prices)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all prices" do
      Price.should_receive(:find).with(:all).and_return(@prices)
      do_get
    end
  
    it "should render the found prices as xml" do
      @prices.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /prices/1" do

    before(:each) do
      @price = mock_model(Price)
      Price.stub!(:find).and_return(@price)
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
  
    it "should find the price requested" do
      Price.should_receive(:find).with("1").and_return(@price)
      do_get
    end
  
    it "should assign the found price for the view" do
      do_get
      assigns[:price].should equal(@price)
    end
  end

  describe "handling GET /prices/1.xml" do

    before(:each) do
      @price = mock_model(Price, :to_xml => "XML")
      Price.stub!(:find).and_return(@price)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the price requested" do
      Price.should_receive(:find).with("1").and_return(@price)
      do_get
    end
  
    it "should render the found price as xml" do
      @price.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /prices/new" do

    before(:each) do
      @price = mock_model(Price)
      Price.stub!(:new).and_return(@price)
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
  
    it "should create an new price" do
      Price.should_receive(:new).and_return(@price)
      do_get
    end
  
    it "should not save the new price" do
      @price.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new price for the view" do
      do_get
      assigns[:price].should equal(@price)
    end
  end

  describe "handling GET /prices/1/edit" do

    before(:each) do
      @price = mock_model(Price)
      Price.stub!(:find).and_return(@price)
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
  
    it "should find the price requested" do
      Price.should_receive(:find).and_return(@price)
      do_get
    end
  
    it "should assign the found Price for the view" do
      do_get
      assigns[:price].should equal(@price)
    end
  end

  describe "handling POST /prices" do

    before(:each) do
      @price = mock_model(Price, :to_param => "1")
      Price.stub!(:new).and_return(@price)
    end
    
    describe "with successful save" do
  
      def do_post
        @price.should_receive(:save).and_return(true)
        post :create, :price => {}
      end
  
      it "should create a new price" do
        Price.should_receive(:new).with({}).and_return(@price)
        do_post
      end

      it "should redirect to the new price" do
        do_post
        response.should redirect_to(price_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @price.should_receive(:save).and_return(false)
        post :create, :price => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /prices/1" do

    before(:each) do
      @price = mock_model(Price, :to_param => "1")
      Price.stub!(:find).and_return(@price)
    end
    
    describe "with successful update" do

      def do_put
        @price.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the price requested" do
        Price.should_receive(:find).with("1").and_return(@price)
        do_put
      end

      it "should update the found price" do
        do_put
        assigns(:price).should equal(@price)
      end

      it "should assign the found price for the view" do
        do_put
        assigns(:price).should equal(@price)
      end

      it "should redirect to the price" do
        do_put
        response.should redirect_to(price_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @price.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /prices/1" do

    before(:each) do
      @price = mock_model(Price, :destroy => true)
      Price.stub!(:find).and_return(@price)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the price requested" do
      Price.should_receive(:find).with("1").and_return(@price)
      do_delete
    end
  
    it "should call destroy on the found price" do
      @price.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the prices list" do
      do_delete
      response.should redirect_to(prices_url)
    end
  end
end
