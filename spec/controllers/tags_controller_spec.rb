require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TagsController do
  describe "handling GET /tags" do

    before(:each) do
      @tag = mock_model(Tag)
      Tag.stub!(:find).and_return([@tag])
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
  
    it "should find all tags" do
      Tag.should_receive(:find).with(:all).and_return([@tag])
      do_get
    end
  
    it "should assign the found tags for the view" do
      do_get
      assigns[:tags].should == [@tag]
    end
  end

  describe "handling GET /tags.xml" do

    before(:each) do
      @tags = mock("Array of Tags", :to_xml => "XML")
      Tag.stub!(:find).and_return(@tags)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all tags" do
      Tag.should_receive(:find).with(:all).and_return(@tags)
      do_get
    end
  
    it "should render the found tags as xml" do
      @tags.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /tags/1" do

    before(:each) do
      @tag = mock_model(Tag)
      Tag.stub!(:find).and_return(@tag)
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
  
    it "should find the tag requested" do
      Tag.should_receive(:find).with("1").and_return(@tag)
      do_get
    end
  
    it "should assign the found tag for the view" do
      do_get
      assigns[:tag].should equal(@tag)
    end
  end

  describe "handling GET /tags/1.xml" do

    before(:each) do
      @tag = mock_model(Tag, :to_xml => "XML")
      Tag.stub!(:find).and_return(@tag)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the tag requested" do
      Tag.should_receive(:find).with("1").and_return(@tag)
      do_get
    end
  
    it "should render the found tag as xml" do
      @tag.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /tags/new" do

    before(:each) do
      @tag = mock_model(Tag)
      Tag.stub!(:new).and_return(@tag)
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
  
    it "should create an new tag" do
      Tag.should_receive(:new).and_return(@tag)
      do_get
    end
  
    it "should not save the new tag" do
      @tag.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new tag for the view" do
      do_get
      assigns[:tag].should equal(@tag)
    end
  end

  describe "handling GET /tags/1/edit" do

    before(:each) do
      @tag = mock_model(Tag)
      Tag.stub!(:find).and_return(@tag)
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
  
    it "should find the tag requested" do
      Tag.should_receive(:find).and_return(@tag)
      do_get
    end
  
    it "should assign the found Tag for the view" do
      do_get
      assigns[:tag].should equal(@tag)
    end
  end

  describe "handling POST /tags" do

    before(:each) do
      @tag = mock_model(Tag, :to_param => "1")
      Tag.stub!(:new).and_return(@tag)
    end
    
    describe "with successful save" do
  
      def do_post
        @tag.should_receive(:save).and_return(true)
        post :create, :tag => {}
      end
  
      it "should create a new tag" do
        Tag.should_receive(:new).with({}).and_return(@tag)
        do_post
      end

      it "should redirect to the new tag" do
        do_post
        response.should redirect_to(tag_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @tag.should_receive(:save).and_return(false)
        post :create, :tag => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /tags/1" do

    before(:each) do
      @tag = mock_model(Tag, :to_param => "1")
      Tag.stub!(:find).and_return(@tag)
    end
    
    describe "with successful update" do

      def do_put
        @tag.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the tag requested" do
        Tag.should_receive(:find).with("1").and_return(@tag)
        do_put
      end

      it "should update the found tag" do
        do_put
        assigns(:tag).should equal(@tag)
      end

      it "should assign the found tag for the view" do
        do_put
        assigns(:tag).should equal(@tag)
      end

      it "should redirect to the tag" do
        do_put
        response.should redirect_to(tag_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @tag.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /tags/1" do

    before(:each) do
      @tag = mock_model(Tag, :destroy => true)
      Tag.stub!(:find).and_return(@tag)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the tag requested" do
      Tag.should_receive(:find).with("1").and_return(@tag)
      do_delete
    end
  
    it "should call destroy on the found tag" do
      @tag.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the tags list" do
      do_delete
      response.should redirect_to(tags_url)
    end
  end
end
