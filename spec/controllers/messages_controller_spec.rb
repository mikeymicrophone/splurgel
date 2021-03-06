require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MessagesController do
  describe "handling GET /messages" do

    before(:each) do
      @message = mock_model(Message)
      Message.stub!(:find).and_return([@message])
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
  
    it "should find all messages" do
      Message.should_receive(:find).with(:all).and_return([@message])
      do_get
    end
  
    it "should assign the found messages for the view" do
      do_get
      assigns[:messages].should == [@message]
    end
  end

  describe "handling GET /messages.xml" do

    before(:each) do
      @messages = mock("Array of Messages", :to_xml => "XML")
      Message.stub!(:find).and_return(@messages)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all messages" do
      Message.should_receive(:find).with(:all).and_return(@messages)
      do_get
    end
  
    it "should render the found messages as xml" do
      @messages.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /messages/1" do

    before(:each) do
      @message = mock_model(Message)
      Message.stub!(:find).and_return(@message)
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
  
    it "should find the message requested" do
      Message.should_receive(:find).with("1").and_return(@message)
      do_get
    end
  
    it "should assign the found message for the view" do
      do_get
      assigns[:message].should equal(@message)
    end
  end

  describe "handling GET /messages/1.xml" do

    before(:each) do
      @message = mock_model(Message, :to_xml => "XML")
      Message.stub!(:find).and_return(@message)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the message requested" do
      Message.should_receive(:find).with("1").and_return(@message)
      do_get
    end
  
    it "should render the found message as xml" do
      @message.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /messages/new" do

    before(:each) do
      @message = mock_model(Message)
      Message.stub!(:new).and_return(@message)
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
  
    it "should create an new message" do
      Message.should_receive(:new).and_return(@message)
      do_get
    end
  
    it "should not save the new message" do
      @message.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new message for the view" do
      do_get
      assigns[:message].should equal(@message)
    end
  end

  describe "handling GET /messages/1/edit" do

    before(:each) do
      @message = mock_model(Message)
      Message.stub!(:find).and_return(@message)
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
  
    it "should find the message requested" do
      Message.should_receive(:find).and_return(@message)
      do_get
    end
  
    it "should assign the found Message for the view" do
      do_get
      assigns[:message].should equal(@message)
    end
  end

  describe "handling POST /messages" do

    before(:each) do
      @message = mock_model(Message, :to_param => "1")
      Message.stub!(:new).and_return(@message)
    end
    
    describe "with successful save" do
  
      def do_post
        @message.should_receive(:save).and_return(true)
        post :create, :message => {}
      end
  
      it "should create a new message" do
        Message.should_receive(:new).with({}).and_return(@message)
        do_post
      end

      it "should redirect to the new message" do
        do_post
        response.should redirect_to(message_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @message.should_receive(:save).and_return(false)
        post :create, :message => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /messages/1" do

    before(:each) do
      @message = mock_model(Message, :to_param => "1")
      Message.stub!(:find).and_return(@message)
    end
    
    describe "with successful update" do

      def do_put
        @message.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the message requested" do
        Message.should_receive(:find).with("1").and_return(@message)
        do_put
      end

      it "should update the found message" do
        do_put
        assigns(:message).should equal(@message)
      end

      it "should assign the found message for the view" do
        do_put
        assigns(:message).should equal(@message)
      end

      it "should redirect to the message" do
        do_put
        response.should redirect_to(message_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @message.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /messages/1" do

    before(:each) do
      @message = mock_model(Message, :destroy => true)
      Message.stub!(:find).and_return(@message)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the message requested" do
      Message.should_receive(:find).with("1").and_return(@message)
      do_delete
    end
  
    it "should call destroy on the found message" do
      @message.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the messages list" do
      do_delete
      response.should redirect_to(messages_url)
    end
  end
end
