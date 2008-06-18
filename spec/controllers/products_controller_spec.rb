require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProductsController do
  describe "handling GET /products" do

    before(:each) do
      @product = mock_model(Product)
      Product.stub!(:find).and_return([@product])
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
  
    it "should find all products" do
      Product.should_receive(:find).with(:all).and_return([@product])
      do_get
    end
  
    it "should assign the found products for the view" do
      do_get
      assigns[:products].should == [@product]
    end
  end

  describe "handling GET /products.xml" do

    before(:each) do
      @products = mock("Array of Products", :to_xml => "XML")
      Product.stub!(:find).and_return(@products)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all products" do
      Product.should_receive(:find).with(:all).and_return(@products)
      do_get
    end
  
    it "should render the found products as xml" do
      @products.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /products/1" do

    before(:each) do
      @product = mock_model(Product)
      Product.stub!(:find).and_return(@product)
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
  
    it "should find the product requested" do
      Product.should_receive(:find).with("1").and_return(@product)
      do_get
    end
  
    it "should assign the found product for the view" do
      do_get
      assigns[:product].should equal(@product)
    end
  end

  describe "handling GET /products/1.xml" do

    before(:each) do
      @product = mock_model(Product, :to_xml => "XML")
      Product.stub!(:find).and_return(@product)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the product requested" do
      Product.should_receive(:find).with("1").and_return(@product)
      do_get
    end
  
    it "should render the found product as xml" do
      @product.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /products/new" do

    before(:each) do
      @product = mock_model(Product)
      Product.stub!(:new).and_return(@product)
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
  
    it "should create an new product" do
      Product.should_receive(:new).and_return(@product)
      do_get
    end
  
    it "should not save the new product" do
      @product.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new product for the view" do
      do_get
      assigns[:product].should equal(@product)
    end
  end

  describe "handling GET /products/1/edit" do

    before(:each) do
      @product = mock_model(Product)
      Product.stub!(:find).and_return(@product)
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
  
    it "should find the product requested" do
      Product.should_receive(:find).and_return(@product)
      do_get
    end
  
    it "should assign the found Product for the view" do
      do_get
      assigns[:product].should equal(@product)
    end
  end

  describe "handling POST /products" do

    before(:each) do
      @product = mock_model(Product, :to_param => "1")
      Product.stub!(:new).and_return(@product)
    end
    
    describe "with successful save" do
  
      def do_post
        @product.should_receive(:save).and_return(true)
        post :create, :product => {}
      end
  
      it "should create a new product" do
        Product.should_receive(:new).with({}).and_return(@product)
        do_post
      end

      it "should redirect to the new product" do
        do_post
        response.should redirect_to(product_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @product.should_receive(:save).and_return(false)
        post :create, :product => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /products/1" do

    before(:each) do
      @product = mock_model(Product, :to_param => "1")
      Product.stub!(:find).and_return(@product)
    end
    
    describe "with successful update" do

      def do_put
        @product.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the product requested" do
        Product.should_receive(:find).with("1").and_return(@product)
        do_put
      end

      it "should update the found product" do
        do_put
        assigns(:product).should equal(@product)
      end

      it "should assign the found product for the view" do
        do_put
        assigns(:product).should equal(@product)
      end

      it "should redirect to the product" do
        do_put
        response.should redirect_to(product_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @product.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /products/1" do

    before(:each) do
      @product = mock_model(Product, :destroy => true)
      Product.stub!(:find).and_return(@product)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the product requested" do
      Product.should_receive(:find).with("1").and_return(@product)
      do_delete
    end
  
    it "should call destroy on the found product" do
      @product.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the products list" do
      do_delete
      response.should redirect_to(products_url)
    end
  end
end
