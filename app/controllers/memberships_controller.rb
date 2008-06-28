class MembershipsController < ApplicationController
  def index
    @memberships = Membership.find :all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @memberships }
    end
  end

  def show
    @membership = Membership.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @membership }
    end
  end

  def new
    @membership = Membership.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @membership }
    end
  end

  def edit
    @membership = Membership.find params[:id]
  end

  def create
    @membership = Membership.new params[:membership]

    respond_to do |format|
      if @membership.save
        flash[:notice] = 'Membership was successfully created.'
        format.html { redirect_to @membership }
        format.xml  { render :xml => @membership, :status => :created, :location => @membership }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @membership.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @membership = Membership.find params[:id]

    respond_to do |format|
      if @membership.update_attributes params[:membership]
        flash[:notice] = 'Membership was successfully updated.'
        format.html { redirect_to @membership }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @membership.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @membership = Membership.find params[:id]
    @membership.destroy

    respond_to do |format|
      format.html { redirect_to memberships_url }
      format.xml  { head :ok }
    end
  end
end
