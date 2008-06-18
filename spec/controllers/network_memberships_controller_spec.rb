require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NetworkMembershipsController do
  describe "handling GET /network_memberships" do

    before(:each) do
      @network_membership = mock_model(NetworkMembership)
      NetworkMembership.stub!(:find).and_return([@network_membership])
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
  
    it "should find all network_memberships" do
      NetworkMembership.should_receive(:find).with(:all).and_return([@network_membership])
      do_get
    end
  
    it "should assign the found network_memberships for the view" do
      do_get
      assigns[:network_memberships].should == [@network_membership]
    end
  end

  describe "handling GET /network_memberships.xml" do

    before(:each) do
      @network_memberships = mock("Array of NetworkMemberships", :to_xml => "XML")
      NetworkMembership.stub!(:find).and_return(@network_memberships)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all network_memberships" do
      NetworkMembership.should_receive(:find).with(:all).and_return(@network_memberships)
      do_get
    end
  
    it "should render the found network_memberships as xml" do
      @network_memberships.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /network_memberships/1" do

    before(:each) do
      @network_membership = mock_model(NetworkMembership)
      NetworkMembership.stub!(:find).and_return(@network_membership)
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
  
    it "should find the network_membership requested" do
      NetworkMembership.should_receive(:find).with("1").and_return(@network_membership)
      do_get
    end
  
    it "should assign the found network_membership for the view" do
      do_get
      assigns[:network_membership].should equal(@network_membership)
    end
  end

  describe "handling GET /network_memberships/1.xml" do

    before(:each) do
      @network_membership = mock_model(NetworkMembership, :to_xml => "XML")
      NetworkMembership.stub!(:find).and_return(@network_membership)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the network_membership requested" do
      NetworkMembership.should_receive(:find).with("1").and_return(@network_membership)
      do_get
    end
  
    it "should render the found network_membership as xml" do
      @network_membership.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /network_memberships/new" do

    before(:each) do
      @network_membership = mock_model(NetworkMembership)
      NetworkMembership.stub!(:new).and_return(@network_membership)
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
  
    it "should create an new network_membership" do
      NetworkMembership.should_receive(:new).and_return(@network_membership)
      do_get
    end
  
    it "should not save the new network_membership" do
      @network_membership.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new network_membership for the view" do
      do_get
      assigns[:network_membership].should equal(@network_membership)
    end
  end

  describe "handling GET /network_memberships/1/edit" do

    before(:each) do
      @network_membership = mock_model(NetworkMembership)
      NetworkMembership.stub!(:find).and_return(@network_membership)
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
  
    it "should find the network_membership requested" do
      NetworkMembership.should_receive(:find).and_return(@network_membership)
      do_get
    end
  
    it "should assign the found NetworkMembership for the view" do
      do_get
      assigns[:network_membership].should equal(@network_membership)
    end
  end

  describe "handling POST /network_memberships" do

    before(:each) do
      @network_membership = mock_model(NetworkMembership, :to_param => "1")
      NetworkMembership.stub!(:new).and_return(@network_membership)
    end
    
    describe "with successful save" do
  
      def do_post
        @network_membership.should_receive(:save).and_return(true)
        post :create, :network_membership => {}
      end
  
      it "should create a new network_membership" do
        NetworkMembership.should_receive(:new).with({}).and_return(@network_membership)
        do_post
      end

      it "should redirect to the new network_membership" do
        do_post
        response.should redirect_to(network_membership_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @network_membership.should_receive(:save).and_return(false)
        post :create, :network_membership => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /network_memberships/1" do

    before(:each) do
      @network_membership = mock_model(NetworkMembership, :to_param => "1")
      NetworkMembership.stub!(:find).and_return(@network_membership)
    end
    
    describe "with successful update" do

      def do_put
        @network_membership.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the network_membership requested" do
        NetworkMembership.should_receive(:find).with("1").and_return(@network_membership)
        do_put
      end

      it "should update the found network_membership" do
        do_put
        assigns(:network_membership).should equal(@network_membership)
      end

      it "should assign the found network_membership for the view" do
        do_put
        assigns(:network_membership).should equal(@network_membership)
      end

      it "should redirect to the network_membership" do
        do_put
        response.should redirect_to(network_membership_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @network_membership.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /network_memberships/1" do

    before(:each) do
      @network_membership = mock_model(NetworkMembership, :destroy => true)
      NetworkMembership.stub!(:find).and_return(@network_membership)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the network_membership requested" do
      NetworkMembership.should_receive(:find).with("1").and_return(@network_membership)
      do_delete
    end
  
    it "should call destroy on the found network_membership" do
      @network_membership.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the network_memberships list" do
      do_delete
      response.should redirect_to(network_memberships_url)
    end
  end
end
