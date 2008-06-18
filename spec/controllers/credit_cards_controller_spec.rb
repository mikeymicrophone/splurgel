require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CreditCardsController do
  describe "handling GET /credit_cards" do

    before(:each) do
      @credit_card = mock_model(CreditCard)
      CreditCard.stub!(:find).and_return([@credit_card])
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
  
    it "should find all credit_cards" do
      CreditCard.should_receive(:find).with(:all).and_return([@credit_card])
      do_get
    end
  
    it "should assign the found credit_cards for the view" do
      do_get
      assigns[:credit_cards].should == [@credit_card]
    end
  end

  describe "handling GET /credit_cards.xml" do

    before(:each) do
      @credit_cards = mock("Array of CreditCards", :to_xml => "XML")
      CreditCard.stub!(:find).and_return(@credit_cards)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all credit_cards" do
      CreditCard.should_receive(:find).with(:all).and_return(@credit_cards)
      do_get
    end
  
    it "should render the found credit_cards as xml" do
      @credit_cards.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /credit_cards/1" do

    before(:each) do
      @credit_card = mock_model(CreditCard)
      CreditCard.stub!(:find).and_return(@credit_card)
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
  
    it "should find the credit_card requested" do
      CreditCard.should_receive(:find).with("1").and_return(@credit_card)
      do_get
    end
  
    it "should assign the found credit_card for the view" do
      do_get
      assigns[:credit_card].should equal(@credit_card)
    end
  end

  describe "handling GET /credit_cards/1.xml" do

    before(:each) do
      @credit_card = mock_model(CreditCard, :to_xml => "XML")
      CreditCard.stub!(:find).and_return(@credit_card)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the credit_card requested" do
      CreditCard.should_receive(:find).with("1").and_return(@credit_card)
      do_get
    end
  
    it "should render the found credit_card as xml" do
      @credit_card.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /credit_cards/new" do

    before(:each) do
      @credit_card = mock_model(CreditCard)
      CreditCard.stub!(:new).and_return(@credit_card)
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
  
    it "should create an new credit_card" do
      CreditCard.should_receive(:new).and_return(@credit_card)
      do_get
    end
  
    it "should not save the new credit_card" do
      @credit_card.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new credit_card for the view" do
      do_get
      assigns[:credit_card].should equal(@credit_card)
    end
  end

  describe "handling GET /credit_cards/1/edit" do

    before(:each) do
      @credit_card = mock_model(CreditCard)
      CreditCard.stub!(:find).and_return(@credit_card)
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
  
    it "should find the credit_card requested" do
      CreditCard.should_receive(:find).and_return(@credit_card)
      do_get
    end
  
    it "should assign the found CreditCard for the view" do
      do_get
      assigns[:credit_card].should equal(@credit_card)
    end
  end

  describe "handling POST /credit_cards" do

    before(:each) do
      @credit_card = mock_model(CreditCard, :to_param => "1")
      CreditCard.stub!(:new).and_return(@credit_card)
    end
    
    describe "with successful save" do
  
      def do_post
        @credit_card.should_receive(:save).and_return(true)
        post :create, :credit_card => {}
      end
  
      it "should create a new credit_card" do
        CreditCard.should_receive(:new).with({}).and_return(@credit_card)
        do_post
      end

      it "should redirect to the new credit_card" do
        do_post
        response.should redirect_to(credit_card_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @credit_card.should_receive(:save).and_return(false)
        post :create, :credit_card => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /credit_cards/1" do

    before(:each) do
      @credit_card = mock_model(CreditCard, :to_param => "1")
      CreditCard.stub!(:find).and_return(@credit_card)
    end
    
    describe "with successful update" do

      def do_put
        @credit_card.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the credit_card requested" do
        CreditCard.should_receive(:find).with("1").and_return(@credit_card)
        do_put
      end

      it "should update the found credit_card" do
        do_put
        assigns(:credit_card).should equal(@credit_card)
      end

      it "should assign the found credit_card for the view" do
        do_put
        assigns(:credit_card).should equal(@credit_card)
      end

      it "should redirect to the credit_card" do
        do_put
        response.should redirect_to(credit_card_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @credit_card.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /credit_cards/1" do

    before(:each) do
      @credit_card = mock_model(CreditCard, :destroy => true)
      CreditCard.stub!(:find).and_return(@credit_card)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the credit_card requested" do
      CreditCard.should_receive(:find).with("1").and_return(@credit_card)
      do_delete
    end
  
    it "should call destroy on the found credit_card" do
      @credit_card.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the credit_cards list" do
      do_delete
      response.should redirect_to(credit_cards_url)
    end
  end
end
