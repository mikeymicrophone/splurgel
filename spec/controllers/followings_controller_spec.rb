require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FollowingsController do
  describe "handling GET /followings" do

    before(:each) do
      @following = mock_model(Following)
      Following.stub!(:find).and_return([@following])
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
  
    it "should find all followings" do
      Following.should_receive(:find).with(:all).and_return([@following])
      do_get
    end
  
    it "should assign the found followings for the view" do
      do_get
      assigns[:followings].should == [@following]
    end
  end

  describe "handling GET /followings.xml" do

    before(:each) do
      @followings = mock("Array of Followings", :to_xml => "XML")
      Following.stub!(:find).and_return(@followings)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all followings" do
      Following.should_receive(:find).with(:all).and_return(@followings)
      do_get
    end
  
    it "should render the found followings as xml" do
      @followings.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /followings/1" do

    before(:each) do
      @following = mock_model(Following)
      Following.stub!(:find).and_return(@following)
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
  
    it "should find the following requested" do
      Following.should_receive(:find).with("1").and_return(@following)
      do_get
    end
  
    it "should assign the found following for the view" do
      do_get
      assigns[:following].should equal(@following)
    end
  end

  describe "handling GET /followings/1.xml" do

    before(:each) do
      @following = mock_model(Following, :to_xml => "XML")
      Following.stub!(:find).and_return(@following)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the following requested" do
      Following.should_receive(:find).with("1").and_return(@following)
      do_get
    end
  
    it "should render the found following as xml" do
      @following.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /followings/new" do

    before(:each) do
      @following = mock_model(Following)
      Following.stub!(:new).and_return(@following)
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
  
    it "should create an new following" do
      Following.should_receive(:new).and_return(@following)
      do_get
    end
  
    it "should not save the new following" do
      @following.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new following for the view" do
      do_get
      assigns[:following].should equal(@following)
    end
  end

  describe "handling GET /followings/1/edit" do

    before(:each) do
      @following = mock_model(Following)
      Following.stub!(:find).and_return(@following)
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
  
    it "should find the following requested" do
      Following.should_receive(:find).and_return(@following)
      do_get
    end
  
    it "should assign the found Following for the view" do
      do_get
      assigns[:following].should equal(@following)
    end
  end

  describe "handling POST /followings" do

    before(:each) do
      @following = mock_model(Following, :to_param => "1")
      Following.stub!(:new).and_return(@following)
    end
    
    describe "with successful save" do
  
      def do_post
        @following.should_receive(:save).and_return(true)
        post :create, :following => {}
      end
  
      it "should create a new following" do
        Following.should_receive(:new).with({}).and_return(@following)
        do_post
      end

      it "should redirect to the new following" do
        do_post
        response.should redirect_to(following_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @following.should_receive(:save).and_return(false)
        post :create, :following => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /followings/1" do

    before(:each) do
      @following = mock_model(Following, :to_param => "1")
      Following.stub!(:find).and_return(@following)
    end
    
    describe "with successful update" do

      def do_put
        @following.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the following requested" do
        Following.should_receive(:find).with("1").and_return(@following)
        do_put
      end

      it "should update the found following" do
        do_put
        assigns(:following).should equal(@following)
      end

      it "should assign the found following for the view" do
        do_put
        assigns(:following).should equal(@following)
      end

      it "should redirect to the following" do
        do_put
        response.should redirect_to(following_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @following.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /followings/1" do

    before(:each) do
      @following = mock_model(Following, :destroy => true)
      Following.stub!(:find).and_return(@following)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the following requested" do
      Following.should_receive(:find).with("1").and_return(@following)
      do_delete
    end
  
    it "should call destroy on the found following" do
      @following.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the followings list" do
      do_delete
      response.should redirect_to(followings_url)
    end
  end
end
