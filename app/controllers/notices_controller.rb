class NoticesController < ApplicationController
  def index
    @notices = Notice.find :all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @notices }
    end
  end

  def show
    @notice = Notice.find params[:id]
    
    current_user.reads_notice @notice

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @notice }
    end
  end

  def new
    params[:notice] ||= {}
    @notice = Notice.new params[:notice]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @notice }
    end
  end

  def edit
    @notice = Notice.find params[:id]
  end

  def create
    @notice = Notice.new params[:notice]

    respond_to do |format|
      if @notice.save
        flash[:notice] = 'Notice was successfully created.'
        format.html { redirect_to @notice }
        format.xml  { render :xml => @notice, :status => :created, :location => @notice }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @notice.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @notice = Notice.find params[:id]

    respond_to do |format|
      if @notice.update_attributes params[:notice]
        flash[:notice] = 'Notice was successfully updated.'
        format.html { redirect_to @notice }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @notice.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @notice = Notice.find params[:id]
    @notice.destroy

    respond_to do |format|
      format.html { redirect_to notices_url }
      format.xml  { head :ok }
    end
  end
end
