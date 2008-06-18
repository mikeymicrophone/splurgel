require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ImageUsesController do
  describe "handling GET /image_uses" do

    before(:each) do
      @image_use = mock_model(ImageUse)
      ImageUse.stub!(:find).and_return([@image_use])
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
  
    it "should find all image_uses" do
      ImageUse.should_receive(:find).with(:all).and_return([@image_use])
      do_get
    end
  
    it "should assign the found image_uses for the view" do
      do_get
      assigns[:image_uses].should == [@image_use]
    end
  end

  describe "handling GET /image_uses.xml" do

    before(:each) do
      @image_uses = mock("Array of ImageUses", :to_xml => "XML")
      ImageUse.stub!(:find).and_return(@image_uses)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all image_uses" do
      ImageUse.should_receive(:find).with(:all).and_return(@image_uses)
      do_get
    end
  
    it "should render the found image_uses as xml" do
      @image_uses.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /image_uses/1" do

    before(:each) do
      @image_use = mock_model(ImageUse)
      ImageUse.stub!(:find).and_return(@image_use)
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
  
    it "should find the image_use requested" do
      ImageUse.should_receive(:find).with("1").and_return(@image_use)
      do_get
    end
  
    it "should assign the found image_use for the view" do
      do_get
      assigns[:image_use].should equal(@image_use)
    end
  end

  describe "handling GET /image_uses/1.xml" do

    before(:each) do
      @image_use = mock_model(ImageUse, :to_xml => "XML")
      ImageUse.stub!(:find).and_return(@image_use)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the image_use requested" do
      ImageUse.should_receive(:find).with("1").and_return(@image_use)
      do_get
    end
  
    it "should render the found image_use as xml" do
      @image_use.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /image_uses/new" do

    before(:each) do
      @image_use = mock_model(ImageUse)
      ImageUse.stub!(:new).and_return(@image_use)
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
  
    it "should create an new image_use" do
      ImageUse.should_receive(:new).and_return(@image_use)
      do_get
    end
  
    it "should not save the new image_use" do
      @image_use.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new image_use for the view" do
      do_get
      assigns[:image_use].should equal(@image_use)
    end
  end

  describe "handling GET /image_uses/1/edit" do

    before(:each) do
      @image_use = mock_model(ImageUse)
      ImageUse.stub!(:find).and_return(@image_use)
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
  
    it "should find the image_use requested" do
      ImageUse.should_receive(:find).and_return(@image_use)
      do_get
    end
  
    it "should assign the found ImageUse for the view" do
      do_get
      assigns[:image_use].should equal(@image_use)
    end
  end

  describe "handling POST /image_uses" do

    before(:each) do
      @image_use = mock_model(ImageUse, :to_param => "1")
      ImageUse.stub!(:new).and_return(@image_use)
    end
    
    describe "with successful save" do
  
      def do_post
        @image_use.should_receive(:save).and_return(true)
        post :create, :image_use => {}
      end
  
      it "should create a new image_use" do
        ImageUse.should_receive(:new).with({}).and_return(@image_use)
        do_post
      end

      it "should redirect to the new image_use" do
        do_post
        response.should redirect_to(image_use_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @image_use.should_receive(:save).and_return(false)
        post :create, :image_use => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /image_uses/1" do

    before(:each) do
      @image_use = mock_model(ImageUse, :to_param => "1")
      ImageUse.stub!(:find).and_return(@image_use)
    end
    
    describe "with successful update" do

      def do_put
        @image_use.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the image_use requested" do
        ImageUse.should_receive(:find).with("1").and_return(@image_use)
        do_put
      end

      it "should update the found image_use" do
        do_put
        assigns(:image_use).should equal(@image_use)
      end

      it "should assign the found image_use for the view" do
        do_put
        assigns(:image_use).should equal(@image_use)
      end

      it "should redirect to the image_use" do
        do_put
        response.should redirect_to(image_use_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @image_use.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /image_uses/1" do

    before(:each) do
      @image_use = mock_model(ImageUse, :destroy => true)
      ImageUse.stub!(:find).and_return(@image_use)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the image_use requested" do
      ImageUse.should_receive(:find).with("1").and_return(@image_use)
      do_delete
    end
  
    it "should call destroy on the found image_use" do
      @image_use.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the image_uses list" do
      do_delete
      response.should redirect_to(image_uses_url)
    end
  end
end
