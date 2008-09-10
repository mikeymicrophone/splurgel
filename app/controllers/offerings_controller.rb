class OfferingsController < ApplicationController
  def index
    @offerings = Offering.find :all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @offerings }
    end
  end

  def show
    @offering = Offering.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @offering }
    end
  end

  def new
    params[:offering] ||= {}
    if params[:product_id]
      params[:offering][:product_id] = params[:product_id]
    end
    if params[:location_id]
      params[:offering][:location_id] = params[:location_id]
      redirect_back_or_default('/') unless current_user.is_authorized_to_create_offerings_at(params[:location_id])
    end
      
    @offering = Offering.new params[:offering]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @offering }
    end
  end

  def edit
    @offering = Offering.find params[:id]
    redirect_back_or_default('/') unless current_user.is_authorized_to_edit_offerings_at(@offering.location_id)
  end

  def create
    @offering = Offering.new params[:offering]
    redirect_to current_user unless current_user.is_authorized_to_create_offerings_at(params[:offering][:location_id])

    respond_to do |format|
      if @offering.save
        flash[:notice] = 'Offering was successfully created.'
        format.html { redirect_to @offering }
        format.xml  { render :xml => @offering, :status => :created, :location => @offering }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @offering.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @offering = Offering.find params[:id]

    respond_to do |format|
      if @offering.update_attributes params[:offering]
        flash[:notice] = 'Offering was successfully updated.'
        format.html { redirect_to @offering }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @offering.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @offering = Offering.find params[:id]
    @offering.destroy

    respond_to do |format|
      format.html { redirect_to offerings_url }
      format.xml  { head :ok }
    end
  end
end
