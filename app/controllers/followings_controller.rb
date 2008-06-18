class FollowingsController < ApplicationController
  # GET /followings
  # GET /followings.xml
  def index
    @followings = Following.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @followings }
    end
  end

  # GET /followings/1
  # GET /followings/1.xml
  def show
    @following = Following.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @following }
    end
  end

  # GET /followings/new
  # GET /followings/new.xml
  def new
    @following = Following.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @following }
    end
  end

  # GET /followings/1/edit
  def edit
    @following = Following.find(params[:id])
  end

  # POST /followings
  # POST /followings.xml
  def create
    @following = Following.new(params[:following])

    respond_to do |format|
      if @following.save
        flash[:notice] = 'Following was successfully created.'
        format.html { redirect_to(@following) }
        format.xml  { render :xml => @following, :status => :created, :location => @following }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @following.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /followings/1
  # PUT /followings/1.xml
  def update
    @following = Following.find(params[:id])

    respond_to do |format|
      if @following.update_attributes(params[:following])
        flash[:notice] = 'Following was successfully updated.'
        format.html { redirect_to(@following) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @following.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /followings/1
  # DELETE /followings/1.xml
  def destroy
    @following = Following.find(params[:id])
    @following.destroy

    respond_to do |format|
      format.html { redirect_to(followings_url) }
      format.xml  { head :ok }
    end
  end
end
