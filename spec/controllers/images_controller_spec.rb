require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ImagesController do
  describe "handling GET /images" do

    before(:each) do
      @image = mock_model(Image)
      Image.stub!(:find).and_return([@image])
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
  
    it "should find all images" do
      Image.should_receive(:find).with(:all).and_return([@image])
      do_get
    end
  
    it "should assign the found images for the view" do
      do_get
      assigns[:images].should == [@image]
    end
  end

  describe "handling GET /images.xml" do

    before(:each) do
      @images = mock("Array of Images", :to_xml => "XML")
      Image.stub!(:find).and_return(@images)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all images" do
      Image.should_receive(:find).with(:all).and_return(@images)
      do_get
    end
  
    it "should render the found images as xml" do
      @images.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /images/1" do

    before(:each) do
      @image = mock_model(Image)
      Image.stub!(:find).and_return(@image)
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
  
    it "should find the image requested" do
      Image.should_receive(:find).with("1").and_return(@image)
      do_get
    end
  
    it "should assign the found image for the view" do
      do_get
      assigns[:image].should equal(@image)
    end
  end

  describe "handling GET /images/1.xml" do

    before(:each) do
      @image = mock_model(Image, :to_xml => "XML")
      Image.stub!(:find).and_return(@image)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the image requested" do
      Image.should_receive(:find).with("1").and_return(@image)
      do_get
    end
  
    it "should render the found image as xml" do
      @image.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /images/new" do

    before(:each) do
      @image = mock_model(Image)
      Image.stub!(:new).and_return(@image)
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
  
    it "should create an new image" do
      Image.should_receive(:new).and_return(@image)
      do_get
    end
  
    it "should not save the new image" do
      @image.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new image for the view" do
      do_get
      assigns[:image].should equal(@image)
    end
  end

  describe "handling GET /images/1/edit" do

    before(:each) do
      @image = mock_model(Image)
      Image.stub!(:find).and_return(@image)
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
  
    it "should find the image requested" do
      Image.should_receive(:find).and_return(@image)
      do_get
    end
  
    it "should assign the found Image for the view" do
      do_get
      assigns[:image].should equal(@image)
    end
  end

  describe "handling POST /images" do

    before(:each) do
      @image = mock_model(Image, :to_param => "1")
      Image.stub!(:new).and_return(@image)
    end
    
    describe "with successful save" do
  
      def do_post
        @image.should_receive(:save).and_return(true)
        post :create, :image => {}
      end
  
      it "should create a new image" do
        Image.should_receive(:new).with({}).and_return(@image)
        do_post
      end

      it "should redirect to the new image" do
        do_post
        response.should redirect_to(image_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @image.should_receive(:save).and_return(false)
        post :create, :image => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /images/1" do

    before(:each) do
      @image = mock_model(Image, :to_param => "1")
      Image.stub!(:find).and_return(@image)
    end
    
    describe "with successful update" do

      def do_put
        @image.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the image requested" do
        Image.should_receive(:find).with("1").and_return(@image)
        do_put
      end

      it "should update the found image" do
        do_put
        assigns(:image).should equal(@image)
      end

      it "should assign the found image for the view" do
        do_put
        assigns(:image).should equal(@image)
      end

      it "should redirect to the image" do
        do_put
        response.should redirect_to(image_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @image.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /images/1" do

    before(:each) do
      @image = mock_model(Image, :destroy => true)
      Image.stub!(:find).and_return(@image)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the image requested" do
      Image.should_receive(:find).with("1").and_return(@image)
      do_delete
    end
  
    it "should call destroy on the found image" do
      @image.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the images list" do
      do_delete
      response.should redirect_to(images_url)
    end
  end
end
