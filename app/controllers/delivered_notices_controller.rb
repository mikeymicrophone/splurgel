class DeliveredNoticesController < ApplicationController
  # GET /delivered_notices
  # GET /delivered_notices.xml
  def index
    @delivered_notices = DeliveredNotice.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @delivered_notices }
    end
  end

  # GET /delivered_notices/1
  # GET /delivered_notices/1.xml
  def show
    @delivered_notice = DeliveredNotice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @delivered_notice }
    end
  end

  # GET /delivered_notices/new
  # GET /delivered_notices/new.xml
  def new
    @delivered_notice = DeliveredNotice.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @delivered_notice }
    end
  end

  # GET /delivered_notices/1/edit
  def edit
    @delivered_notice = DeliveredNotice.find(params[:id])
  end

  # POST /delivered_notices
  # POST /delivered_notices.xml
  def create
    @delivered_notice = DeliveredNotice.new(params[:delivered_notice])

    respond_to do |format|
      if @delivered_notice.save
        flash[:notice] = 'DeliveredNotice was successfully created.'
        format.html { redirect_to(@delivered_notice) }
        format.xml  { render :xml => @delivered_notice, :status => :created, :location => @delivered_notice }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @delivered_notice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /delivered_notices/1
  # PUT /delivered_notices/1.xml
  def update
    @delivered_notice = DeliveredNotice.find(params[:id])

    respond_to do |format|
      if @delivered_notice.update_attributes(params[:delivered_notice])
        flash[:notice] = 'DeliveredNotice was successfully updated.'
        format.html { redirect_to(@delivered_notice) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @delivered_notice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /delivered_notices/1
  # DELETE /delivered_notices/1.xml
  def destroy
    @delivered_notice = DeliveredNotice.find(params[:id])
    @delivered_notice.destroy

    respond_to do |format|
      format.html { redirect_to(delivered_notices_url) }
      format.xml  { head :ok }
    end
  end
end
