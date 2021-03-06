class FollowingsController < ApplicationController
  def index
    @followings = if params[:user_id]
      Following.find(:all, :conditions => {:follower_type => 'User', :follower_id => params[:user_id]})
    else
      Following.find :all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @followings }
    end
  end

  def show
    @following = Following.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @following }
    end
  end

  def new
    params[:following] ||= {}
    @following = Following.new params[:following]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @following }
    end
  end

  def edit
    @following = Following.find params[:id]
  end

  def create
    params[:following][:follower_id] = current_user_id if params[:following] && params[:following][:follower_type] == 'User'
    @following = Following.new params[:following]

    respond_to do |format|
      if @following.save
        flash[:notice] = 'Following was successfully created.'
        format.html { redirect_to @following }
        format.js   { render :text => 'now following' }
        format.xml  { render :xml => @following, :status => :created, :location => @following }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @following.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @following = Following.find params[:id]

    respond_to do |format|
      if @following.update_attributes params[:following]
        flash[:notice] = 'Following was successfully updated.'
        format.html { redirect_to @following }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @following.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @following = Following.find params[:id]
    @following.destroy

    respond_to do |format|
      format.html { redirect_to followings_url }
      format.xml  { head :ok }
    end
  end
end
