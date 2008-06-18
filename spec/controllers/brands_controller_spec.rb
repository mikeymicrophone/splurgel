require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BrandsController do
  describe "handling GET /brands" do

    before(:each) do
      @brand = mock_model(Brand)
      Brand.stub!(:find).and_return([@brand])
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
  
    it "should find all brands" do
      Brand.should_receive(:find).with(:all).and_return([@brand])
      do_get
    end
  
    it "should assign the found brands for the view" do
      do_get
      assigns[:brands].should == [@brand]
    end
  end

  describe "handling GET /brands.xml" do

    before(:each) do
      @brands = mock("Array of Brands", :to_xml => "XML")
      Brand.stub!(:find).and_return(@brands)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all brands" do
      Brand.should_receive(:find).with(:all).and_return(@brands)
      do_get
    end
  
    it "should render the found brands as xml" do
      @brands.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /brands/1" do

    before(:each) do
      @brand = mock_model(Brand)
      Brand.stub!(:find).and_return(@brand)
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
  
    it "should find the brand requested" do
      Brand.should_receive(:find).with("1").and_return(@brand)
      do_get
    end
  
    it "should assign the found brand for the view" do
      do_get
      assigns[:brand].should equal(@brand)
    end
  end

  describe "handling GET /brands/1.xml" do

    before(:each) do
      @brand = mock_model(Brand, :to_xml => "XML")
      Brand.stub!(:find).and_return(@brand)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the brand requested" do
      Brand.should_receive(:find).with("1").and_return(@brand)
      do_get
    end
  
    it "should render the found brand as xml" do
      @brand.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /brands/new" do

    before(:each) do
      @brand = mock_model(Brand)
      Brand.stub!(:new).and_return(@brand)
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
  
    it "should create an new brand" do
      Brand.should_receive(:new).and_return(@brand)
      do_get
    end
  
    it "should not save the new brand" do
      @brand.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new brand for the view" do
      do_get
      assigns[:brand].should equal(@brand)
    end
  end

  describe "handling GET /brands/1/edit" do

    before(:each) do
      @brand = mock_model(Brand)
      Brand.stub!(:find).and_return(@brand)
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
  
    it "should find the brand requested" do
      Brand.should_receive(:find).and_return(@brand)
      do_get
    end
  
    it "should assign the found Brand for the view" do
      do_get
      assigns[:brand].should equal(@brand)
    end
  end

  describe "handling POST /brands" do

    before(:each) do
      @brand = mock_model(Brand, :to_param => "1")
      Brand.stub!(:new).and_return(@brand)
    end
    
    describe "with successful save" do
  
      def do_post
        @brand.should_receive(:save).and_return(true)
        post :create, :brand => {}
      end
  
      it "should create a new brand" do
        Brand.should_receive(:new).with({}).and_return(@brand)
        do_post
      end

      it "should redirect to the new brand" do
        do_post
        response.should redirect_to(brand_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @brand.should_receive(:save).and_return(false)
        post :create, :brand => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /brands/1" do

    before(:each) do
      @brand = mock_model(Brand, :to_param => "1")
      Brand.stub!(:find).and_return(@brand)
    end
    
    describe "with successful update" do

      def do_put
        @brand.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the brand requested" do
        Brand.should_receive(:find).with("1").and_return(@brand)
        do_put
      end

      it "should update the found brand" do
        do_put
        assigns(:brand).should equal(@brand)
      end

      it "should assign the found brand for the view" do
        do_put
        assigns(:brand).should equal(@brand)
      end

      it "should redirect to the brand" do
        do_put
        response.should redirect_to(brand_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @brand.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /brands/1" do

    before(:each) do
      @brand = mock_model(Brand, :destroy => true)
      Brand.stub!(:find).and_return(@brand)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the brand requested" do
      Brand.should_receive(:find).with("1").and_return(@brand)
      do_delete
    end
  
    it "should call destroy on the found brand" do
      @brand.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the brands list" do
      do_delete
      response.should redirect_to(brands_url)
    end
  end
end
