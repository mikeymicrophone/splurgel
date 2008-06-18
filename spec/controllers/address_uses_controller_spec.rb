require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AddressUsesController do
  describe "handling GET /address_uses" do

    before(:each) do
      @address_use = mock_model(AddressUse)
      AddressUse.stub!(:find).and_return([@address_use])
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
  
    it "should find all address_uses" do
      AddressUse.should_receive(:find).with(:all).and_return([@address_use])
      do_get
    end
  
    it "should assign the found address_uses for the view" do
      do_get
      assigns[:address_uses].should == [@address_use]
    end
  end

  describe "handling GET /address_uses.xml" do

    before(:each) do
      @address_uses = mock("Array of AddressUses", :to_xml => "XML")
      AddressUse.stub!(:find).and_return(@address_uses)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all address_uses" do
      AddressUse.should_receive(:find).with(:all).and_return(@address_uses)
      do_get
    end
  
    it "should render the found address_uses as xml" do
      @address_uses.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /address_uses/1" do

    before(:each) do
      @address_use = mock_model(AddressUse)
      AddressUse.stub!(:find).and_return(@address_use)
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
  
    it "should find the address_use requested" do
      AddressUse.should_receive(:find).with("1").and_return(@address_use)
      do_get
    end
  
    it "should assign the found address_use for the view" do
      do_get
      assigns[:address_use].should equal(@address_use)
    end
  end

  describe "handling GET /address_uses/1.xml" do

    before(:each) do
      @address_use = mock_model(AddressUse, :to_xml => "XML")
      AddressUse.stub!(:find).and_return(@address_use)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the address_use requested" do
      AddressUse.should_receive(:find).with("1").and_return(@address_use)
      do_get
    end
  
    it "should render the found address_use as xml" do
      @address_use.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /address_uses/new" do

    before(:each) do
      @address_use = mock_model(AddressUse)
      AddressUse.stub!(:new).and_return(@address_use)
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
  
    it "should create an new address_use" do
      AddressUse.should_receive(:new).and_return(@address_use)
      do_get
    end
  
    it "should not save the new address_use" do
      @address_use.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new address_use for the view" do
      do_get
      assigns[:address_use].should equal(@address_use)
    end
  end

  describe "handling GET /address_uses/1/edit" do

    before(:each) do
      @address_use = mock_model(AddressUse)
      AddressUse.stub!(:find).and_return(@address_use)
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
  
    it "should find the address_use requested" do
      AddressUse.should_receive(:find).and_return(@address_use)
      do_get
    end
  
    it "should assign the found AddressUse for the view" do
      do_get
      assigns[:address_use].should equal(@address_use)
    end
  end

  describe "handling POST /address_uses" do

    before(:each) do
      @address_use = mock_model(AddressUse, :to_param => "1")
      AddressUse.stub!(:new).and_return(@address_use)
    end
    
    describe "with successful save" do
  
      def do_post
        @address_use.should_receive(:save).and_return(true)
        post :create, :address_use => {}
      end
  
      it "should create a new address_use" do
        AddressUse.should_receive(:new).with({}).and_return(@address_use)
        do_post
      end

      it "should redirect to the new address_use" do
        do_post
        response.should redirect_to(address_use_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @address_use.should_receive(:save).and_return(false)
        post :create, :address_use => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /address_uses/1" do

    before(:each) do
      @address_use = mock_model(AddressUse, :to_param => "1")
      AddressUse.stub!(:find).and_return(@address_use)
    end
    
    describe "with successful update" do

      def do_put
        @address_use.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the address_use requested" do
        AddressUse.should_receive(:find).with("1").and_return(@address_use)
        do_put
      end

      it "should update the found address_use" do
        do_put
        assigns(:address_use).should equal(@address_use)
      end

      it "should assign the found address_use for the view" do
        do_put
        assigns(:address_use).should equal(@address_use)
      end

      it "should redirect to the address_use" do
        do_put
        response.should redirect_to(address_use_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @address_use.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /address_uses/1" do

    before(:each) do
      @address_use = mock_model(AddressUse, :destroy => true)
      AddressUse.stub!(:find).and_return(@address_use)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the address_use requested" do
      AddressUse.should_receive(:find).with("1").and_return(@address_use)
      do_delete
    end
  
    it "should call destroy on the found address_use" do
      @address_use.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the address_uses list" do
      do_delete
      response.should redirect_to(address_uses_url)
    end
  end
end
