class NetworksController < ApplicationController
  def index
    @networks = Network.scope_down params, 'tag'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @networks }
    end
  end

  def show
    @network = Network.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @network }
    end
  end

  def new
    params[:network] ||= {}
    @network = Network.new params[:network]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @network }
    end
  end

  def edit
    @network = Network.find params[:id]
  end

  def create
    @network = Network.new params[:network]

    respond_to do |format|
      if @network.save
        flash[:notice] = 'Network was successfully created.'
        format.html { redirect_to @network }
        format.xml  { render :xml => @network, :status => :created, :location => @network }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @network.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @network = Network.find params[:id]

    respond_to do |format|
      if @network.update_attributes params[:network]
        flash[:notice] = 'Network was successfully updated.'
        format.html { redirect_to @network }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @network.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @network = Network.find params[:id]
    @network.destroy

    respond_to do |format|
      format.html { redirect_to networks_url }
      format.xml  { head :ok }
    end
  end
end
