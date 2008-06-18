require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CitiesController do
  describe "handling GET /cities" do

    before(:each) do
      @city = mock_model(City)
      City.stub!(:find).and_return([@city])
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
  
    it "should find all cities" do
      City.should_receive(:find).with(:all).and_return([@city])
      do_get
    end
  
    it "should assign the found cities for the view" do
      do_get
      assigns[:cities].should == [@city]
    end
  end

  describe "handling GET /cities.xml" do

    before(:each) do
      @cities = mock("Array of Cities", :to_xml => "XML")
      City.stub!(:find).and_return(@cities)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all cities" do
      City.should_receive(:find).with(:all).and_return(@cities)
      do_get
    end
  
    it "should render the found cities as xml" do
      @cities.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /cities/1" do

    before(:each) do
      @city = mock_model(City)
      City.stub!(:find).and_return(@city)
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
  
    it "should find the city requested" do
      City.should_receive(:find).with("1").and_return(@city)
      do_get
    end
  
    it "should assign the found city for the view" do
      do_get
      assigns[:city].should equal(@city)
    end
  end

  describe "handling GET /cities/1.xml" do

    before(:each) do
      @city = mock_model(City, :to_xml => "XML")
      City.stub!(:find).and_return(@city)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the city requested" do
      City.should_receive(:find).with("1").and_return(@city)
      do_get
    end
  
    it "should render the found city as xml" do
      @city.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /cities/new" do

    before(:each) do
      @city = mock_model(City)
      City.stub!(:new).and_return(@city)
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
  
    it "should create an new city" do
      City.should_receive(:new).and_return(@city)
      do_get
    end
  
    it "should not save the new city" do
      @city.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new city for the view" do
      do_get
      assigns[:city].should equal(@city)
    end
  end

  describe "handling GET /cities/1/edit" do

    before(:each) do
      @city = mock_model(City)
      City.stub!(:find).and_return(@city)
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
  
    it "should find the city requested" do
      City.should_receive(:find).and_return(@city)
      do_get
    end
  
    it "should assign the found City for the view" do
      do_get
      assigns[:city].should equal(@city)
    end
  end

  describe "handling POST /cities" do

    before(:each) do
      @city = mock_model(City, :to_param => "1")
      City.stub!(:new).and_return(@city)
    end
    
    describe "with successful save" do
  
      def do_post
        @city.should_receive(:save).and_return(true)
        post :create, :city => {}
      end
  
      it "should create a new city" do
        City.should_receive(:new).with({}).and_return(@city)
        do_post
      end

      it "should redirect to the new city" do
        do_post
        response.should redirect_to(city_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @city.should_receive(:save).and_return(false)
        post :create, :city => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /cities/1" do

    before(:each) do
      @city = mock_model(City, :to_param => "1")
      City.stub!(:find).and_return(@city)
    end
    
    describe "with successful update" do

      def do_put
        @city.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the city requested" do
        City.should_receive(:find).with("1").and_return(@city)
        do_put
      end

      it "should update the found city" do
        do_put
        assigns(:city).should equal(@city)
      end

      it "should assign the found city for the view" do
        do_put
        assigns(:city).should equal(@city)
      end

      it "should redirect to the city" do
        do_put
        response.should redirect_to(city_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @city.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /cities/1" do

    before(:each) do
      @city = mock_model(City, :destroy => true)
      City.stub!(:find).and_return(@city)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the city requested" do
      City.should_receive(:find).with("1").and_return(@city)
      do_delete
    end
  
    it "should call destroy on the found city" do
      @city.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the cities list" do
      do_delete
      response.should redirect_to(cities_url)
    end
  end
end
