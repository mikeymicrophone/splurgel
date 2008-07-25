require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PhoneUsesController do
  describe "handling GET /phone_uses" do

    before(:each) do
      @phone_use = mock_model(PhoneUse)
      PhoneUse.stub!(:find).and_return([@phone_use])
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
  
    it "should find all phone_uses" do
      PhoneUse.should_receive(:find).with(:all).and_return([@phone_use])
      do_get
    end
  
    it "should assign the found phone_uses for the view" do
      do_get
      assigns[:phone_uses].should == [@phone_use]
    end
  end

  describe "handling GET /phone_uses.xml" do

    before(:each) do
      @phone_uses = mock("Array of PhoneUses", :to_xml => "XML")
      PhoneUse.stub!(:find).and_return(@phone_uses)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all phone_uses" do
      PhoneUse.should_receive(:find).with(:all).and_return(@phone_uses)
      do_get
    end
  
    it "should render the found phone_uses as xml" do
      @phone_uses.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /phone_uses/1" do

    before(:each) do
      @phone_use = mock_model(PhoneUse)
      PhoneUse.stub!(:find).and_return(@phone_use)
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
  
    it "should find the phone_use requested" do
      PhoneUse.should_receive(:find).with("1").and_return(@phone_use)
      do_get
    end
  
    it "should assign the found phone_use for the view" do
      do_get
      assigns[:phone_use].should equal(@phone_use)
    end
  end

  describe "handling GET /phone_uses/1.xml" do

    before(:each) do
      @phone_use = mock_model(PhoneUse, :to_xml => "XML")
      PhoneUse.stub!(:find).and_return(@phone_use)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the phone_use requested" do
      PhoneUse.should_receive(:find).with("1").and_return(@phone_use)
      do_get
    end
  
    it "should render the found phone_use as xml" do
      @phone_use.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /phone_uses/new" do

    before(:each) do
      @phone_use = mock_model(PhoneUse)
      PhoneUse.stub!(:new).and_return(@phone_use)
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
  
    it "should create an new phone_use" do
      PhoneUse.should_receive(:new).and_return(@phone_use)
      do_get
    end
  
    it "should not save the new phone_use" do
      @phone_use.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new phone_use for the view" do
      do_get
      assigns[:phone_use].should equal(@phone_use)
    end
  end

  describe "handling GET /phone_uses/1/edit" do

    before(:each) do
      @phone_use = mock_model(PhoneUse)
      PhoneUse.stub!(:find).and_return(@phone_use)
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
  
    it "should find the phone_use requested" do
      PhoneUse.should_receive(:find).and_return(@phone_use)
      do_get
    end
  
    it "should assign the found PhoneUse for the view" do
      do_get
      assigns[:phone_use].should equal(@phone_use)
    end
  end

  describe "handling POST /phone_uses" do

    before(:each) do
      @phone_use = mock_model(PhoneUse, :to_param => "1")
      PhoneUse.stub!(:new).and_return(@phone_use)
    end
    
    describe "with successful save" do
  
      def do_post
        @phone_use.should_receive(:save).and_return(true)
        post :create, :phone_use => {}
      end
  
      it "should create a new phone_use" do
        PhoneUse.should_receive(:new).with({}).and_return(@phone_use)
        do_post
      end

      it "should redirect to the new phone_use" do
        do_post
        response.should redirect_to(phone_use_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @phone_use.should_receive(:save).and_return(false)
        post :create, :phone_use => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /phone_uses/1" do

    before(:each) do
      @phone_use = mock_model(PhoneUse, :to_param => "1")
      PhoneUse.stub!(:find).and_return(@phone_use)
    end
    
    describe "with successful update" do

      def do_put
        @phone_use.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the phone_use requested" do
        PhoneUse.should_receive(:find).with("1").and_return(@phone_use)
        do_put
      end

      it "should update the found phone_use" do
        do_put
        assigns(:phone_use).should equal(@phone_use)
      end

      it "should assign the found phone_use for the view" do
        do_put
        assigns(:phone_use).should equal(@phone_use)
      end

      it "should redirect to the phone_use" do
        do_put
        response.should redirect_to(phone_use_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @phone_use.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /phone_uses/1" do

    before(:each) do
      @phone_use = mock_model(PhoneUse, :destroy => true)
      PhoneUse.stub!(:find).and_return(@phone_use)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the phone_use requested" do
      PhoneUse.should_receive(:find).with("1").and_return(@phone_use)
      do_delete
    end
  
    it "should call destroy on the found phone_use" do
      @phone_use.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the phone_uses list" do
      do_delete
      response.should redirect_to(phone_uses_url)
    end
  end
end
