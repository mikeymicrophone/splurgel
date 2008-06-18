require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StatesController do
  describe "handling GET /states" do

    before(:each) do
      @state = mock_model(State)
      State.stub!(:find).and_return([@state])
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
  
    it "should find all states" do
      State.should_receive(:find).with(:all).and_return([@state])
      do_get
    end
  
    it "should assign the found states for the view" do
      do_get
      assigns[:states].should == [@state]
    end
  end

  describe "handling GET /states.xml" do

    before(:each) do
      @states = mock("Array of States", :to_xml => "XML")
      State.stub!(:find).and_return(@states)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all states" do
      State.should_receive(:find).with(:all).and_return(@states)
      do_get
    end
  
    it "should render the found states as xml" do
      @states.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /states/1" do

    before(:each) do
      @state = mock_model(State)
      State.stub!(:find).and_return(@state)
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
  
    it "should find the state requested" do
      State.should_receive(:find).with("1").and_return(@state)
      do_get
    end
  
    it "should assign the found state for the view" do
      do_get
      assigns[:state].should equal(@state)
    end
  end

  describe "handling GET /states/1.xml" do

    before(:each) do
      @state = mock_model(State, :to_xml => "XML")
      State.stub!(:find).and_return(@state)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the state requested" do
      State.should_receive(:find).with("1").and_return(@state)
      do_get
    end
  
    it "should render the found state as xml" do
      @state.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /states/new" do

    before(:each) do
      @state = mock_model(State)
      State.stub!(:new).and_return(@state)
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
  
    it "should create an new state" do
      State.should_receive(:new).and_return(@state)
      do_get
    end
  
    it "should not save the new state" do
      @state.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new state for the view" do
      do_get
      assigns[:state].should equal(@state)
    end
  end

  describe "handling GET /states/1/edit" do

    before(:each) do
      @state = mock_model(State)
      State.stub!(:find).and_return(@state)
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
  
    it "should find the state requested" do
      State.should_receive(:find).and_return(@state)
      do_get
    end
  
    it "should assign the found State for the view" do
      do_get
      assigns[:state].should equal(@state)
    end
  end

  describe "handling POST /states" do

    before(:each) do
      @state = mock_model(State, :to_param => "1")
      State.stub!(:new).and_return(@state)
    end
    
    describe "with successful save" do
  
      def do_post
        @state.should_receive(:save).and_return(true)
        post :create, :state => {}
      end
  
      it "should create a new state" do
        State.should_receive(:new).with({}).and_return(@state)
        do_post
      end

      it "should redirect to the new state" do
        do_post
        response.should redirect_to(state_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @state.should_receive(:save).and_return(false)
        post :create, :state => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /states/1" do

    before(:each) do
      @state = mock_model(State, :to_param => "1")
      State.stub!(:find).and_return(@state)
    end
    
    describe "with successful update" do

      def do_put
        @state.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the state requested" do
        State.should_receive(:find).with("1").and_return(@state)
        do_put
      end

      it "should update the found state" do
        do_put
        assigns(:state).should equal(@state)
      end

      it "should assign the found state for the view" do
        do_put
        assigns(:state).should equal(@state)
      end

      it "should redirect to the state" do
        do_put
        response.should redirect_to(state_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @state.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /states/1" do

    before(:each) do
      @state = mock_model(State, :destroy => true)
      State.stub!(:find).and_return(@state)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the state requested" do
      State.should_receive(:find).with("1").and_return(@state)
      do_delete
    end
  
    it "should call destroy on the found state" do
      @state.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the states list" do
      do_delete
      response.should redirect_to(states_url)
    end
  end
end
