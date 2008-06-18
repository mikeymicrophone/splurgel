require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AddressesController do
  describe "handling GET /addresses" do

    before(:each) do
      @address = mock_model(Address)
      Address.stub!(:find).and_return([@address])
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
  
    it "should find all addresses" do
      Address.should_receive(:find).with(:all).and_return([@address])
      do_get
    end
  
    it "should assign the found addresses for the view" do
      do_get
      assigns[:addresses].should == [@address]
    end
  end

  describe "handling GET /addresses.xml" do

    before(:each) do
      @addresses = mock("Array of Addresses", :to_xml => "XML")
      Address.stub!(:find).and_return(@addresses)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all addresses" do
      Address.should_receive(:find).with(:all).and_return(@addresses)
      do_get
    end
  
    it "should render the found addresses as xml" do
      @addresses.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /addresses/1" do

    before(:each) do
      @address = mock_model(Address)
      Address.stub!(:find).and_return(@address)
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
  
    it "should find the address requested" do
      Address.should_receive(:find).with("1").and_return(@address)
      do_get
    end
  
    it "should assign the found address for the view" do
      do_get
      assigns[:address].should equal(@address)
    end
  end

  describe "handling GET /addresses/1.xml" do

    before(:each) do
      @address = mock_model(Address, :to_xml => "XML")
      Address.stub!(:find).and_return(@address)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the address requested" do
      Address.should_receive(:find).with("1").and_return(@address)
      do_get
    end
  
    it "should render the found address as xml" do
      @address.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /addresses/new" do

    before(:each) do
      @address = mock_model(Address)
      Address.stub!(:new).and_return(@address)
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
  
    it "should create an new address" do
      Address.should_receive(:new).and_return(@address)
      do_get
    end
  
    it "should not save the new address" do
      @address.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new address for the view" do
      do_get
      assigns[:address].should equal(@address)
    end
  end

  describe "handling GET /addresses/1/edit" do

    before(:each) do
      @address = mock_model(Address)
      Address.stub!(:find).and_return(@address)
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
  
    it "should find the address requested" do
      Address.should_receive(:find).and_return(@address)
      do_get
    end
  
    it "should assign the found Address for the view" do
      do_get
      assigns[:address].should equal(@address)
    end
  end

  describe "handling POST /addresses" do

    before(:each) do
      @address = mock_model(Address, :to_param => "1")
      Address.stub!(:new).and_return(@address)
    end
    
    describe "with successful save" do
  
      def do_post
        @address.should_receive(:save).and_return(true)
        post :create, :address => {}
      end
  
      it "should create a new address" do
        Address.should_receive(:new).with({}).and_return(@address)
        do_post
      end

      it "should redirect to the new address" do
        do_post
        response.should redirect_to(address_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @address.should_receive(:save).and_return(false)
        post :create, :address => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /addresses/1" do

    before(:each) do
      @address = mock_model(Address, :to_param => "1")
      Address.stub!(:find).and_return(@address)
    end
    
    describe "with successful update" do

      def do_put
        @address.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the address requested" do
        Address.should_receive(:find).with("1").and_return(@address)
        do_put
      end

      it "should update the found address" do
        do_put
        assigns(:address).should equal(@address)
      end

      it "should assign the found address for the view" do
        do_put
        assigns(:address).should equal(@address)
      end

      it "should redirect to the address" do
        do_put
        response.should redirect_to(address_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @address.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /addresses/1" do

    before(:each) do
      @address = mock_model(Address, :destroy => true)
      Address.stub!(:find).and_return(@address)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the address requested" do
      Address.should_receive(:find).with("1").and_return(@address)
      do_delete
    end
  
    it "should call destroy on the found address" do
      @address.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the addresses list" do
      do_delete
      response.should redirect_to(addresses_url)
    end
  end
end
