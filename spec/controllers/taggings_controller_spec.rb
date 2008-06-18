require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TaggingsController do
  describe "handling GET /taggings" do

    before(:each) do
      @tagging = mock_model(Tagging)
      Tagging.stub!(:find).and_return([@tagging])
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
  
    it "should find all taggings" do
      Tagging.should_receive(:find).with(:all).and_return([@tagging])
      do_get
    end
  
    it "should assign the found taggings for the view" do
      do_get
      assigns[:taggings].should == [@tagging]
    end
  end

  describe "handling GET /taggings.xml" do

    before(:each) do
      @taggings = mock("Array of Taggings", :to_xml => "XML")
      Tagging.stub!(:find).and_return(@taggings)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all taggings" do
      Tagging.should_receive(:find).with(:all).and_return(@taggings)
      do_get
    end
  
    it "should render the found taggings as xml" do
      @taggings.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /taggings/1" do

    before(:each) do
      @tagging = mock_model(Tagging)
      Tagging.stub!(:find).and_return(@tagging)
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
  
    it "should find the tagging requested" do
      Tagging.should_receive(:find).with("1").and_return(@tagging)
      do_get
    end
  
    it "should assign the found tagging for the view" do
      do_get
      assigns[:tagging].should equal(@tagging)
    end
  end

  describe "handling GET /taggings/1.xml" do

    before(:each) do
      @tagging = mock_model(Tagging, :to_xml => "XML")
      Tagging.stub!(:find).and_return(@tagging)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the tagging requested" do
      Tagging.should_receive(:find).with("1").and_return(@tagging)
      do_get
    end
  
    it "should render the found tagging as xml" do
      @tagging.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /taggings/new" do

    before(:each) do
      @tagging = mock_model(Tagging)
      Tagging.stub!(:new).and_return(@tagging)
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
  
    it "should create an new tagging" do
      Tagging.should_receive(:new).and_return(@tagging)
      do_get
    end
  
    it "should not save the new tagging" do
      @tagging.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new tagging for the view" do
      do_get
      assigns[:tagging].should equal(@tagging)
    end
  end

  describe "handling GET /taggings/1/edit" do

    before(:each) do
      @tagging = mock_model(Tagging)
      Tagging.stub!(:find).and_return(@tagging)
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
  
    it "should find the tagging requested" do
      Tagging.should_receive(:find).and_return(@tagging)
      do_get
    end
  
    it "should assign the found Tagging for the view" do
      do_get
      assigns[:tagging].should equal(@tagging)
    end
  end

  describe "handling POST /taggings" do

    before(:each) do
      @tagging = mock_model(Tagging, :to_param => "1")
      Tagging.stub!(:new).and_return(@tagging)
    end
    
    describe "with successful save" do
  
      def do_post
        @tagging.should_receive(:save).and_return(true)
        post :create, :tagging => {}
      end
  
      it "should create a new tagging" do
        Tagging.should_receive(:new).with({}).and_return(@tagging)
        do_post
      end

      it "should redirect to the new tagging" do
        do_post
        response.should redirect_to(tagging_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @tagging.should_receive(:save).and_return(false)
        post :create, :tagging => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /taggings/1" do

    before(:each) do
      @tagging = mock_model(Tagging, :to_param => "1")
      Tagging.stub!(:find).and_return(@tagging)
    end
    
    describe "with successful update" do

      def do_put
        @tagging.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the tagging requested" do
        Tagging.should_receive(:find).with("1").and_return(@tagging)
        do_put
      end

      it "should update the found tagging" do
        do_put
        assigns(:tagging).should equal(@tagging)
      end

      it "should assign the found tagging for the view" do
        do_put
        assigns(:tagging).should equal(@tagging)
      end

      it "should redirect to the tagging" do
        do_put
        response.should redirect_to(tagging_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @tagging.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /taggings/1" do

    before(:each) do
      @tagging = mock_model(Tagging, :destroy => true)
      Tagging.stub!(:find).and_return(@tagging)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the tagging requested" do
      Tagging.should_receive(:find).with("1").and_return(@tagging)
      do_delete
    end
  
    it "should call destroy on the found tagging" do
      @tagging.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the taggings list" do
      do_delete
      response.should redirect_to(taggings_url)
    end
  end
end
