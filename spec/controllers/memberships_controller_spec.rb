require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MembershipsController do
  describe "handling GET /memberships" do

    before(:each) do
      @membership = mock_model(Membership)
      Membership.stub!(:find).and_return([@membership])
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
  
    it "should find all memberships" do
      Membership.should_receive(:find).with(:all).and_return([@membership])
      do_get
    end
  
    it "should assign the found memberships for the view" do
      do_get
      assigns[:memberships].should == [@membership]
    end
  end

  describe "handling GET /memberships.xml" do

    before(:each) do
      @memberships = mock("Array of Memberships", :to_xml => "XML")
      Membership.stub!(:find).and_return(@memberships)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all memberships" do
      Membership.should_receive(:find).with(:all).and_return(@memberships)
      do_get
    end
  
    it "should render the found memberships as xml" do
      @memberships.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /memberships/1" do

    before(:each) do
      @membership = mock_model(Membership)
      Membership.stub!(:find).and_return(@membership)
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
  
    it "should find the membership requested" do
      Membership.should_receive(:find).with("1").and_return(@membership)
      do_get
    end
  
    it "should assign the found membership for the view" do
      do_get
      assigns[:membership].should equal(@membership)
    end
  end

  describe "handling GET /memberships/1.xml" do

    before(:each) do
      @membership = mock_model(Membership, :to_xml => "XML")
      Membership.stub!(:find).and_return(@membership)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the membership requested" do
      Membership.should_receive(:find).with("1").and_return(@membership)
      do_get
    end
  
    it "should render the found membership as xml" do
      @membership.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /memberships/new" do

    before(:each) do
      @membership = mock_model(Membership)
      Membership.stub!(:new).and_return(@membership)
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
  
    it "should create an new membership" do
      Membership.should_receive(:new).and_return(@membership)
      do_get
    end
  
    it "should not save the new membership" do
      @membership.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new membership for the view" do
      do_get
      assigns[:membership].should equal(@membership)
    end
  end

  describe "handling GET /memberships/1/edit" do

    before(:each) do
      @membership = mock_model(Membership)
      Membership.stub!(:find).and_return(@membership)
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
  
    it "should find the membership requested" do
      Membership.should_receive(:find).and_return(@membership)
      do_get
    end
  
    it "should assign the found Membership for the view" do
      do_get
      assigns[:membership].should equal(@membership)
    end
  end

  describe "handling POST /memberships" do

    before(:each) do
      @membership = mock_model(Membership, :to_param => "1")
      Membership.stub!(:new).and_return(@membership)
    end
    
    describe "with successful save" do
  
      def do_post
        @membership.should_receive(:save).and_return(true)
        post :create, :membership => {}
      end
  
      it "should create a new membership" do
        Membership.should_receive(:new).with({}).and_return(@membership)
        do_post
      end

      it "should redirect to the new membership" do
        do_post
        response.should redirect_to(membership_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @membership.should_receive(:save).and_return(false)
        post :create, :membership => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /memberships/1" do

    before(:each) do
      @membership = mock_model(Membership, :to_param => "1")
      Membership.stub!(:find).and_return(@membership)
    end
    
    describe "with successful update" do

      def do_put
        @membership.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the membership requested" do
        Membership.should_receive(:find).with("1").and_return(@membership)
        do_put
      end

      it "should update the found membership" do
        do_put
        assigns(:membership).should equal(@membership)
      end

      it "should assign the found membership for the view" do
        do_put
        assigns(:membership).should equal(@membership)
      end

      it "should redirect to the membership" do
        do_put
        response.should redirect_to(membership_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @membership.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /memberships/1" do

    before(:each) do
      @membership = mock_model(Membership, :destroy => true)
      Membership.stub!(:find).and_return(@membership)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the membership requested" do
      Membership.should_receive(:find).with("1").and_return(@membership)
      do_delete
    end
  
    it "should call destroy on the found membership" do
      @membership.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the memberships list" do
      do_delete
      response.should redirect_to(memberships_url)
    end
  end
end
