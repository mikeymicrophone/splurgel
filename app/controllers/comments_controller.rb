class CommentsController < ApplicationController
  def reply_to
    render :partial => 'comment_form', :locals => {:obj => Comment.find(params[:id])}
  end
  
  def index
    @comments = if params[:group_id]
      (@group = Group.find(params[:group_id])).comments
    else
      Comment.find :all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  def show
    @comment = Comment.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  def new
    params[:comment] ||= {}
    @comment = Comment.new params[:comment]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  def edit
    @comment = Comment.find params[:id]
  end

  def create
    @comment = Comment.new params[:comment]

    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        format.html { render :partial => @comment }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @comment = Comment.find params[:id]

    respond_to do |format|
      if @comment.update_attributes params[:comment]
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to @comment }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.xml  { head :ok }
    end
  end
end
