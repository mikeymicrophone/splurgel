class LocationsController < ApplicationController
  def index
    @locations = if params[:store_id]
      (@store = Store.find(params[:store_id])).locations
    elsif params[:product_id]
      Product.find(params[:product_id]).locations
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
    params[:location] ||= {}
    params[:location][:store_id] ||= params[:store_id]
    @location = Location.new params[:location]

    respond_to do |format|
      if params[:store_id] && !current_user.is_authorized_to_create_locations_of(params[:store_id])
        format.html { redirect_back_or_default('/') }
      else
        format.html # new.html.erb
        format.xml  { render :xml => @location }
      end
    end
  end

  def edit
    @location = Location.find params[:id]
    redirect_back_or_default('/') unless current_user.is_authorized_to_edit_locations_of(@location.store_id)
  end

  def create
    @phone = Phone.find_or_create_by_number(params[:phone][:number]) if params[:phone]
    params[:location][:primary_phone_id] = @phone.id if @phone
    
    @address = Address.create params[:address]
    params[:location][:address_id] = @address.id if @address && @address.valid?
    
    @location = Location.new params[:location]
    
    respond_to do |format|
      if current_user.is_authorized_to_create_locations_of(params[:location][:store_id])
        if @location.save
          @location.uses_phone @phone
          flash[:notice] = 'Location was successfully created.'
          format.html { redirect_to @location }
          format.xml  { render :xml => @location, :status => :created, :location => @location }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
        end
      else
        format.html { redirect_to current_user }
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
