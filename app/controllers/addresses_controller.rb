class AddressesController < ApplicationController
  def index
    @addresses = Address.find :all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @addresses }
    end
  end

  def show
    @address = Address.find params[:id]
    @map = GMap.new("map_div")
	  @map.control_init(:large_map => true, :map_type => true)
	  @map.center_zoom_init([@address.latitude, @address.longitude], 14)
	  @map.overlay_init(GMarker.new([@address.latitude, @address.longitude], :title => @address.name, :info_window => @address.name))
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @address }
    end
  end

  def new
    params[:address] ||= {}
    @address = Address.new params[:address]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @address }
    end
  end

  def edit
    @address = Address.find params[:id]
  end

  def create
    @address = Address.new params[:address]

    respond_to do |format|
      if @address.save
        flash[:notice] = 'Address was successfully created.'
        format.html { redirect_to @address }
        format.xml  { render :xml => @address, :status => :created, :location => @address }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @address = Address.find params[:id]

    respond_to do |format|
      if @address.update_attributes params[:address]
        flash[:notice] = 'Address was successfully updated.'
        format.html { redirect_to @address }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @address = Address.find params[:id]
    @address.destroy

    respond_to do |format|
      format.html { redirect_to addresses_url }
      format.xml  { head :ok }
    end
  end
end
