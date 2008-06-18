require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NetworksController do
  describe "handling GET /networks" do

    before(:each) do
      @network = mock_model(Network)
      Network.stub!(:find).and_return([@network])
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
  
    it "should find all networks" do
      Network.should_receive(:find).with(:all).and_return([@network])
      do_get
    end
  
    it "should assign the found networks for the view" do
      do_get
      assigns[:networks].should == [@network]
    end
  end

  describe "handling GET /networks.xml" do

    before(:each) do
      @networks = mock("Array of Networks", :to_xml => "XML")
      Network.stub!(:find).and_return(@networks)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all networks" do
      Network.should_receive(:find).with(:all).and_return(@networks)
      do_get
    end
  
    it "should render the found networks as xml" do
      @networks.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /networks/1" do

    before(:each) do
      @network = mock_model(Network)
      Network.stub!(:find).and_return(@network)
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
  
    it "should find the network requested" do
      Network.should_receive(:find).with("1").and_return(@network)
      do_get
    end
  
    it "should assign the found network for the view" do
      do_get
      assigns[:network].should equal(@network)
    end
  end

  describe "handling GET /networks/1.xml" do

    before(:each) do
      @network = mock_model(Network, :to_xml => "XML")
      Network.stub!(:find).and_return(@network)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the network requested" do
      Network.should_receive(:find).with("1").and_return(@network)
      do_get
    end
  
    it "should render the found network as xml" do
      @network.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /networks/new" do

    before(:each) do
      @network = mock_model(Network)
      Network.stub!(:new).and_return(@network)
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
  
    it "should create an new network" do
      Network.should_receive(:new).and_return(@network)
      do_get
    end
  
    it "should not save the new network" do
      @network.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new network for the view" do
      do_get
      assigns[:network].should equal(@network)
    end
  end

  describe "handling GET /networks/1/edit" do

    before(:each) do
      @network = mock_model(Network)
      Network.stub!(:find).and_return(@network)
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
  
    it "should find the network requested" do
      Network.should_receive(:find).and_return(@network)
      do_get
    end
  
    it "should assign the found Network for the view" do
      do_get
      assigns[:network].should equal(@network)
    end
  end

  describe "handling POST /networks" do

    before(:each) do
      @network = mock_model(Network, :to_param => "1")
      Network.stub!(:new).and_return(@network)
    end
    
    describe "with successful save" do
  
      def do_post
        @network.should_receive(:save).and_return(true)
        post :create, :network => {}
      end
  
      it "should create a new network" do
        Network.should_receive(:new).with({}).and_return(@network)
        do_post
      end

      it "should redirect to the new network" do
        do_post
        response.should redirect_to(network_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @network.should_receive(:save).and_return(false)
        post :create, :network => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /networks/1" do

    before(:each) do
      @network = mock_model(Network, :to_param => "1")
      Network.stub!(:find).and_return(@network)
    end
    
    describe "with successful update" do

      def do_put
        @network.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the network requested" do
        Network.should_receive(:find).with("1").and_return(@network)
        do_put
      end

      it "should update the found network" do
        do_put
        assigns(:network).should equal(@network)
      end

      it "should assign the found network for the view" do
        do_put
        assigns(:network).should equal(@network)
      end

      it "should redirect to the network" do
        do_put
        response.should redirect_to(network_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @network.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /networks/1" do

    before(:each) do
      @network = mock_model(Network, :destroy => true)
      Network.stub!(:find).and_return(@network)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the network requested" do
      Network.should_receive(:find).with("1").and_return(@network)
      do_delete
    end
  
    it "should call destroy on the found network" do
      @network.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the networks list" do
      do_delete
      response.should redirect_to(networks_url)
    end
  end
end
