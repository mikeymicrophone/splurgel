require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SchedulesController do
  describe "handling GET /schedules" do

    before(:each) do
      @schedule = mock_model(Schedule)
      Schedule.stub!(:find).and_return([@schedule])
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
  
    it "should find all schedules" do
      Schedule.should_receive(:find).with(:all).and_return([@schedule])
      do_get
    end
  
    it "should assign the found schedules for the view" do
      do_get
      assigns[:schedules].should == [@schedule]
    end
  end

  describe "handling GET /schedules.xml" do

    before(:each) do
      @schedules = mock("Array of Schedules", :to_xml => "XML")
      Schedule.stub!(:find).and_return(@schedules)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all schedules" do
      Schedule.should_receive(:find).with(:all).and_return(@schedules)
      do_get
    end
  
    it "should render the found schedules as xml" do
      @schedules.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /schedules/1" do

    before(:each) do
      @schedule = mock_model(Schedule)
      Schedule.stub!(:find).and_return(@schedule)
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
  
    it "should find the schedule requested" do
      Schedule.should_receive(:find).with("1").and_return(@schedule)
      do_get
    end
  
    it "should assign the found schedule for the view" do
      do_get
      assigns[:schedule].should equal(@schedule)
    end
  end

  describe "handling GET /schedules/1.xml" do

    before(:each) do
      @schedule = mock_model(Schedule, :to_xml => "XML")
      Schedule.stub!(:find).and_return(@schedule)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the schedule requested" do
      Schedule.should_receive(:find).with("1").and_return(@schedule)
      do_get
    end
  
    it "should render the found schedule as xml" do
      @schedule.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /schedules/new" do

    before(:each) do
      @schedule = mock_model(Schedule)
      Schedule.stub!(:new).and_return(@schedule)
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
  
    it "should create an new schedule" do
      Schedule.should_receive(:new).and_return(@schedule)
      do_get
    end
  
    it "should not save the new schedule" do
      @schedule.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new schedule for the view" do
      do_get
      assigns[:schedule].should equal(@schedule)
    end
  end

  describe "handling GET /schedules/1/edit" do

    before(:each) do
      @schedule = mock_model(Schedule)
      Schedule.stub!(:find).and_return(@schedule)
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
  
    it "should find the schedule requested" do
      Schedule.should_receive(:find).and_return(@schedule)
      do_get
    end
  
    it "should assign the found Schedule for the view" do
      do_get
      assigns[:schedule].should equal(@schedule)
    end
  end

  describe "handling POST /schedules" do

    before(:each) do
      @schedule = mock_model(Schedule, :to_param => "1")
      Schedule.stub!(:new).and_return(@schedule)
    end
    
    describe "with successful save" do
  
      def do_post
        @schedule.should_receive(:save).and_return(true)
        post :create, :schedule => {}
      end
  
      it "should create a new schedule" do
        Schedule.should_receive(:new).with({}).and_return(@schedule)
        do_post
      end

      it "should redirect to the new schedule" do
        do_post
        response.should redirect_to(schedule_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @schedule.should_receive(:save).and_return(false)
        post :create, :schedule => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /schedules/1" do

    before(:each) do
      @schedule = mock_model(Schedule, :to_param => "1")
      Schedule.stub!(:find).and_return(@schedule)
    end
    
    describe "with successful update" do

      def do_put
        @schedule.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the schedule requested" do
        Schedule.should_receive(:find).with("1").and_return(@schedule)
        do_put
      end

      it "should update the found schedule" do
        do_put
        assigns(:schedule).should equal(@schedule)
      end

      it "should assign the found schedule for the view" do
        do_put
        assigns(:schedule).should equal(@schedule)
      end

      it "should redirect to the schedule" do
        do_put
        response.should redirect_to(schedule_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @schedule.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /schedules/1" do

    before(:each) do
      @schedule = mock_model(Schedule, :destroy => true)
      Schedule.stub!(:find).and_return(@schedule)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the schedule requested" do
      Schedule.should_receive(:find).with("1").and_return(@schedule)
      do_delete
    end
  
    it "should call destroy on the found schedule" do
      @schedule.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the schedules list" do
      do_delete
      response.should redirect_to(schedules_url)
    end
  end
end
