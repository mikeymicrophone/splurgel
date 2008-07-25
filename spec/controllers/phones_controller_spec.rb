require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PhonesController do
  describe "handling GET /phones" do

    before(:each) do
      @phone = mock_model(Phone)
      Phone.stub!(:find).and_return([@phone])
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
  
    it "should find all phones" do
      Phone.should_receive(:find).with(:all).and_return([@phone])
      do_get
    end
  
    it "should assign the found phones for the view" do
      do_get
      assigns[:phones].should == [@phone]
    end
  end

  describe "handling GET /phones.xml" do

    before(:each) do
      @phones = mock("Array of Phones", :to_xml => "XML")
      Phone.stub!(:find).and_return(@phones)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all phones" do
      Phone.should_receive(:find).with(:all).and_return(@phones)
      do_get
    end
  
    it "should render the found phones as xml" do
      @phones.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /phones/1" do

    before(:each) do
      @phone = mock_model(Phone)
      Phone.stub!(:find).and_return(@phone)
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
  
    it "should find the phone requested" do
      Phone.should_receive(:find).with("1").and_return(@phone)
      do_get
    end
  
    it "should assign the found phone for the view" do
      do_get
      assigns[:phone].should equal(@phone)
    end
  end

  describe "handling GET /phones/1.xml" do

    before(:each) do
      @phone = mock_model(Phone, :to_xml => "XML")
      Phone.stub!(:find).and_return(@phone)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the phone requested" do
      Phone.should_receive(:find).with("1").and_return(@phone)
      do_get
    end
  
    it "should render the found phone as xml" do
      @phone.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /phones/new" do

    before(:each) do
      @phone = mock_model(Phone)
      Phone.stub!(:new).and_return(@phone)
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
  
    it "should create an new phone" do
      Phone.should_receive(:new).and_return(@phone)
      do_get
    end
  
    it "should not save the new phone" do
      @phone.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new phone for the view" do
      do_get
      assigns[:phone].should equal(@phone)
    end
  end

  describe "handling GET /phones/1/edit" do

    before(:each) do
      @phone = mock_model(Phone)
      Phone.stub!(:find).and_return(@phone)
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
  
    it "should find the phone requested" do
      Phone.should_receive(:find).and_return(@phone)
      do_get
    end
  
    it "should assign the found Phone for the view" do
      do_get
      assigns[:phone].should equal(@phone)
    end
  end

  describe "handling POST /phones" do

    before(:each) do
      @phone = mock_model(Phone, :to_param => "1")
      Phone.stub!(:new).and_return(@phone)
    end
    
    describe "with successful save" do
  
      def do_post
        @phone.should_receive(:save).and_return(true)
        post :create, :phone => {}
      end
  
      it "should create a new phone" do
        Phone.should_receive(:new).with({}).and_return(@phone)
        do_post
      end

      it "should redirect to the new phone" do
        do_post
        response.should redirect_to(phone_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @phone.should_receive(:save).and_return(false)
        post :create, :phone => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /phones/1" do

    before(:each) do
      @phone = mock_model(Phone, :to_param => "1")
      Phone.stub!(:find).and_return(@phone)
    end
    
    describe "with successful update" do

      def do_put
        @phone.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the phone requested" do
        Phone.should_receive(:find).with("1").and_return(@phone)
        do_put
      end

      it "should update the found phone" do
        do_put
        assigns(:phone).should equal(@phone)
      end

      it "should assign the found phone for the view" do
        do_put
        assigns(:phone).should equal(@phone)
      end

      it "should redirect to the phone" do
        do_put
        response.should redirect_to(phone_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @phone.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /phones/1" do

    before(:each) do
      @phone = mock_model(Phone, :destroy => true)
      Phone.stub!(:find).and_return(@phone)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the phone requested" do
      Phone.should_receive(:find).with("1").and_return(@phone)
      do_delete
    end
  
    it "should call destroy on the found phone" do
      @phone.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the phones list" do
      do_delete
      response.should redirect_to(phones_url)
    end
  end
end
