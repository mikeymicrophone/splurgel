class CitiesController < ApplicationController
  def index
    @cities = City.scope_down self, params, 'state'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cities }
    end
  end

  def show
    @city = City.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @city }
    end
  end

  def new
    params[:city] ||= {}
    @city = City.new params[:city]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @city }
    end
  end

  def edit
    @city = City.find params[:id]
  end

  def create
    @city = City.new params[:city]

    respond_to do |format|
      if @city.save
        flash[:notice] = 'City was successfully created.'
        format.html { redirect_to @city }
        format.xml  { render :xml => @city, :status => :created, :location => @city }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @city.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @city = City.find params[:id]

    respond_to do |format|
      if @city.update_attributes params[:city]
        flash[:notice] = 'City was successfully updated.'
        format.html { redirect_to @city }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @city.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @city = City.find params[:id]
    @city.destroy

    respond_to do |format|
      format.html { redirect_to cities_url }
      format.xml  { head :ok }
    end
  end
end
