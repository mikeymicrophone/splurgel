class NetworkMembershipsController < ApplicationController
  def index
    @network_memberships = NetworkMembership.find :all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @network_memberships }
    end
  end

  def show
    @network_membership = NetworkMembership.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @network_membership }
    end
  end

  def new
    params[:network_membership] ||= {}
    @network_membership = NetworkMembership.new params[:network_membership]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @network_membership }
    end
  end

  def edit
    @network_membership = NetworkMembership.find params[:id]
  end

  def create
    @network_membership = NetworkMembership.new params[:network_membership]

    respond_to do |format|
      if @network_membership.save
        flash[:notice] = 'NetworkMembership was successfully created.'
        format.html { redirect_to @network_membership }
        format.xml  { render :xml => @network_membership, :status => :created, :location => @network_membership }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @network_membership.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @network_membership = NetworkMembership.find params[:id]

    respond_to do |format|
      if @network_membership.update_attributes params[:network_membership]
        flash[:notice] = 'NetworkMembership was successfully updated.'
        format.html { redirect_to @network_membership }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @network_membership.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @network_membership = NetworkMembership.find params[:id]
    @network_membership.destroy

    respond_to do |format|
      format.html { redirect_to network_memberships_url }
      format.xml  { head :ok }
    end
  end
end
