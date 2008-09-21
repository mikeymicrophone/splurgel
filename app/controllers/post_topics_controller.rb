class PostTopicsController < ApplicationController
  # GET /post_topics
  # GET /post_topics.xml
  def index
    @post_topics = PostTopic.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @post_topics }
    end
  end

  # GET /post_topics/1
  # GET /post_topics/1.xml
  def show
    @post_topic = PostTopic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post_topic }
    end
  end

  # GET /post_topics/new
  # GET /post_topics/new.xml
  def new
    @post_topic = PostTopic.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post_topic }
    end
  end

  # GET /post_topics/1/edit
  def edit
    @post_topic = PostTopic.find(params[:id])
  end

  # POST /post_topics
  # POST /post_topics.xml
  def create
    @post_topic = PostTopic.new(params[:post_topic])

    respond_to do |format|
      if @post_topic.save
        flash[:notice] = 'PostTopic was successfully created.'
        format.html { redirect_to(@post_topic) }
        format.xml  { render :xml => @post_topic, :status => :created, :location => @post_topic }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post_topic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /post_topics/1
  # PUT /post_topics/1.xml
  def update
    @post_topic = PostTopic.find(params[:id])

    respond_to do |format|
      if @post_topic.update_attributes(params[:post_topic])
        flash[:notice] = 'PostTopic was successfully updated.'
        format.html { redirect_to(@post_topic) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post_topic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /post_topics/1
  # DELETE /post_topics/1.xml
  def destroy
    @post_topic = PostTopic.find(params[:id])
    @post_topic.destroy

    respond_to do |format|
      format.html { redirect_to(post_topics_url) }
      format.xml  { head :ok }
    end
  end
end
