class LocationsController < ApplicationController
  def index
    @locations = if params[:store_id]
      Store.find(params[:store_id]).locations
    else
      Location.find :all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locations }
    end
  end

  def show
    @location = Location.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @location }
    end
  end

  def new
    @location = Location.new(:store_id => params[:store_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @location }
    end
  end

  def edit
    @location = Location.find params[:id]
  end

  def create
    @phone = Phone.find_or_create_by_number(params[:phone][:number]) if params[:phone]
    params[:location][:primary_phone_id] = @phone.id if @phone
    
    @location = Location.new params[:location]
    
    respond_to do |format|
      if @location.save
        @location.uses_phone @phone
        flash[:notice] = 'Location was successfully created.'
        format.html { redirect_to @location }
        format.xml  { render :xml => @location, :status => :created, :location => @location }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @location = Location.find params[:id]

    respond_to do |format|
      if @location.update_attributes params[:location]
        flash[:notice] = 'Location was successfully updated.'
        format.html { redirect_to @location }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @location = Location.find params[:id]
    @location.destroy

    respond_to do |format|
      format.html { redirect_to locations_url }
      format.xml  { head :ok }
    end
  end
end
