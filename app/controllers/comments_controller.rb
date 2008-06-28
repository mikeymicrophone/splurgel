class CommentsController < ApplicationController
  def index
    @comments = Comment.find :all

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
    @comment = Comment.new

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
        format.html { redirect_to @comment }
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
