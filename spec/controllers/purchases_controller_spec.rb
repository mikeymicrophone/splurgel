require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PurchasesController do
  describe "handling GET /purchases" do

    before(:each) do
      @purchase = mock_model(Purchase)
      Purchase.stub!(:find).and_return([@purchase])
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
  
    it "should find all purchases" do
      Purchase.should_receive(:find).with(:all).and_return([@purchase])
      do_get
    end
  
    it "should assign the found purchases for the view" do
      do_get
      assigns[:purchases].should == [@purchase]
    end
  end

  describe "handling GET /purchases.xml" do

    before(:each) do
      @purchases = mock("Array of Purchases", :to_xml => "XML")
      Purchase.stub!(:find).and_return(@purchases)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all purchases" do
      Purchase.should_receive(:find).with(:all).and_return(@purchases)
      do_get
    end
  
    it "should render the found purchases as xml" do
      @purchases.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /purchases/1" do

    before(:each) do
      @purchase = mock_model(Purchase)
      Purchase.stub!(:find).and_return(@purchase)
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
  
    it "should find the purchase requested" do
      Purchase.should_receive(:find).with("1").and_return(@purchase)
      do_get
    end
  
    it "should assign the found purchase for the view" do
      do_get
      assigns[:purchase].should equal(@purchase)
    end
  end

  describe "handling GET /purchases/1.xml" do

    before(:each) do
      @purchase = mock_model(Purchase, :to_xml => "XML")
      Purchase.stub!(:find).and_return(@purchase)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the purchase requested" do
      Purchase.should_receive(:find).with("1").and_return(@purchase)
      do_get
    end
  
    it "should render the found purchase as xml" do
      @purchase.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /purchases/new" do

    before(:each) do
      @purchase = mock_model(Purchase)
      Purchase.stub!(:new).and_return(@purchase)
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
  
    it "should create an new purchase" do
      Purchase.should_receive(:new).and_return(@purchase)
      do_get
    end
  
    it "should not save the new purchase" do
      @purchase.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new purchase for the view" do
      do_get
      assigns[:purchase].should equal(@purchase)
    end
  end

  describe "handling GET /purchases/1/edit" do

    before(:each) do
      @purchase = mock_model(Purchase)
      Purchase.stub!(:find).and_return(@purchase)
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
  
    it "should find the purchase requested" do
      Purchase.should_receive(:find).and_return(@purchase)
      do_get
    end
  
    it "should assign the found Purchase for the view" do
      do_get
      assigns[:purchase].should equal(@purchase)
    end
  end

  describe "handling POST /purchases" do

    before(:each) do
      @purchase = mock_model(Purchase, :to_param => "1")
      Purchase.stub!(:new).and_return(@purchase)
    end
    
    describe "with successful save" do
  
      def do_post
        @purchase.should_receive(:save).and_return(true)
        post :create, :purchase => {}
      end
  
      it "should create a new purchase" do
        Purchase.should_receive(:new).with({}).and_return(@purchase)
        do_post
      end

      it "should redirect to the new purchase" do
        do_post
        response.should redirect_to(purchase_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @purchase.should_receive(:save).and_return(false)
        post :create, :purchase => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /purchases/1" do

    before(:each) do
      @purchase = mock_model(Purchase, :to_param => "1")
      Purchase.stub!(:find).and_return(@purchase)
    end
    
    describe "with successful update" do

      def do_put
        @purchase.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the purchase requested" do
        Purchase.should_receive(:find).with("1").and_return(@purchase)
        do_put
      end

      it "should update the found purchase" do
        do_put
        assigns(:purchase).should equal(@purchase)
      end

      it "should assign the found purchase for the view" do
        do_put
        assigns(:purchase).should equal(@purchase)
      end

      it "should redirect to the purchase" do
        do_put
        response.should redirect_to(purchase_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @purchase.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /purchases/1" do

    before(:each) do
      @purchase = mock_model(Purchase, :destroy => true)
      Purchase.stub!(:find).and_return(@purchase)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the purchase requested" do
      Purchase.should_receive(:find).with("1").and_return(@purchase)
      do_delete
    end
  
    it "should call destroy on the found purchase" do
      @purchase.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the purchases list" do
      do_delete
      response.should redirect_to(purchases_url)
    end
  end
end
