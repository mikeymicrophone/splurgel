require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BlogPostsController do

  def mock_blog_post(stubs={})
    @mock_blog_post ||= mock_model(BlogPost, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all blog_posts as @blog_posts" do
      BlogPost.should_receive(:find).with(:all).and_return([mock_blog_post])
      get :index
      assigns[:blog_posts].should == [mock_blog_post]
    end

    describe "with mime type of xml" do
  
      it "should render all blog_posts as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        BlogPost.should_receive(:find).with(:all).and_return(blog_posts = mock("Array of BlogPosts"))
        blog_posts.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested blog_post as @blog_post" do
      BlogPost.should_receive(:find).with("37").and_return(mock_blog_post)
      get :show, :id => "37"
      assigns[:blog_post].should equal(mock_blog_post)
    end
    
    describe "with mime type of xml" do

      it "should render the requested blog_post as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        BlogPost.should_receive(:find).with("37").and_return(mock_blog_post)
        mock_blog_post.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new blog_post as @blog_post" do
      BlogPost.should_receive(:new).and_return(mock_blog_post)
      get :new
      assigns[:blog_post].should equal(mock_blog_post)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested blog_post as @blog_post" do
      BlogPost.should_receive(:find).with("37").and_return(mock_blog_post)
      get :edit, :id => "37"
      assigns[:blog_post].should equal(mock_blog_post)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created blog_post as @blog_post" do
        BlogPost.should_receive(:new).with({'these' => 'params'}).and_return(mock_blog_post(:save => true))
        post :create, :blog_post => {:these => 'params'}
        assigns(:blog_post).should equal(mock_blog_post)
      end

      it "should redirect to the created blog_post" do
        BlogPost.stub!(:new).and_return(mock_blog_post(:save => true))
        post :create, :blog_post => {}
        response.should redirect_to(blog_post_url(mock_blog_post))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved blog_post as @blog_post" do
        BlogPost.stub!(:new).with({'these' => 'params'}).and_return(mock_blog_post(:save => false))
        post :create, :blog_post => {:these => 'params'}
        assigns(:blog_post).should equal(mock_blog_post)
      end

      it "should re-render the 'new' template" do
        BlogPost.stub!(:new).and_return(mock_blog_post(:save => false))
        post :create, :blog_post => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested blog_post" do
        BlogPost.should_receive(:find).with("37").and_return(mock_blog_post)
        mock_blog_post.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :blog_post => {:these => 'params'}
      end

      it "should expose the requested blog_post as @blog_post" do
        BlogPost.stub!(:find).and_return(mock_blog_post(:update_attributes => true))
        put :update, :id => "1"
        assigns(:blog_post).should equal(mock_blog_post)
      end

      it "should redirect to the blog_post" do
        BlogPost.stub!(:find).and_return(mock_blog_post(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(blog_post_url(mock_blog_post))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested blog_post" do
        BlogPost.should_receive(:find).with("37").and_return(mock_blog_post)
        mock_blog_post.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :blog_post => {:these => 'params'}
      end

      it "should expose the blog_post as @blog_post" do
        BlogPost.stub!(:find).and_return(mock_blog_post(:update_attributes => false))
        put :update, :id => "1"
        assigns(:blog_post).should equal(mock_blog_post)
      end

      it "should re-render the 'edit' template" do
        BlogPost.stub!(:find).and_return(mock_blog_post(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested blog_post" do
      BlogPost.should_receive(:find).with("37").and_return(mock_blog_post)
      mock_blog_post.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the blog_posts list" do
      BlogPost.stub!(:find).and_return(mock_blog_post(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(blog_posts_url)
    end

  end

end
