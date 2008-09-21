require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PostTopicsController do

  def mock_post_topic(stubs={})
    @mock_post_topic ||= mock_model(PostTopic, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all post_topics as @post_topics" do
      PostTopic.should_receive(:find).with(:all).and_return([mock_post_topic])
      get :index
      assigns[:post_topics].should == [mock_post_topic]
    end

    describe "with mime type of xml" do
  
      it "should render all post_topics as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        PostTopic.should_receive(:find).with(:all).and_return(post_topics = mock("Array of PostTopics"))
        post_topics.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested post_topic as @post_topic" do
      PostTopic.should_receive(:find).with("37").and_return(mock_post_topic)
      get :show, :id => "37"
      assigns[:post_topic].should equal(mock_post_topic)
    end
    
    describe "with mime type of xml" do

      it "should render the requested post_topic as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        PostTopic.should_receive(:find).with("37").and_return(mock_post_topic)
        mock_post_topic.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new post_topic as @post_topic" do
      PostTopic.should_receive(:new).and_return(mock_post_topic)
      get :new
      assigns[:post_topic].should equal(mock_post_topic)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested post_topic as @post_topic" do
      PostTopic.should_receive(:find).with("37").and_return(mock_post_topic)
      get :edit, :id => "37"
      assigns[:post_topic].should equal(mock_post_topic)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created post_topic as @post_topic" do
        PostTopic.should_receive(:new).with({'these' => 'params'}).and_return(mock_post_topic(:save => true))
        post :create, :post_topic => {:these => 'params'}
        assigns(:post_topic).should equal(mock_post_topic)
      end

      it "should redirect to the created post_topic" do
        PostTopic.stub!(:new).and_return(mock_post_topic(:save => true))
        post :create, :post_topic => {}
        response.should redirect_to(post_topic_url(mock_post_topic))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved post_topic as @post_topic" do
        PostTopic.stub!(:new).with({'these' => 'params'}).and_return(mock_post_topic(:save => false))
        post :create, :post_topic => {:these => 'params'}
        assigns(:post_topic).should equal(mock_post_topic)
      end

      it "should re-render the 'new' template" do
        PostTopic.stub!(:new).and_return(mock_post_topic(:save => false))
        post :create, :post_topic => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested post_topic" do
        PostTopic.should_receive(:find).with("37").and_return(mock_post_topic)
        mock_post_topic.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :post_topic => {:these => 'params'}
      end

      it "should expose the requested post_topic as @post_topic" do
        PostTopic.stub!(:find).and_return(mock_post_topic(:update_attributes => true))
        put :update, :id => "1"
        assigns(:post_topic).should equal(mock_post_topic)
      end

      it "should redirect to the post_topic" do
        PostTopic.stub!(:find).and_return(mock_post_topic(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(post_topic_url(mock_post_topic))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested post_topic" do
        PostTopic.should_receive(:find).with("37").and_return(mock_post_topic)
        mock_post_topic.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :post_topic => {:these => 'params'}
      end

      it "should expose the post_topic as @post_topic" do
        PostTopic.stub!(:find).and_return(mock_post_topic(:update_attributes => false))
        put :update, :id => "1"
        assigns(:post_topic).should equal(mock_post_topic)
      end

      it "should re-render the 'edit' template" do
        PostTopic.stub!(:find).and_return(mock_post_topic(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested post_topic" do
      PostTopic.should_receive(:find).with("37").and_return(mock_post_topic)
      mock_post_topic.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the post_topics list" do
      PostTopic.stub!(:find).and_return(mock_post_topic(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(post_topics_url)
    end

  end

end
