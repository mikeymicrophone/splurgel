class AddressUsesController < ApplicationController
  def index
    @address_uses = AddressUse.find :all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @address_uses }
    end
  end

  def show
    @address_use = AddressUse.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @address_use }
    end
  end

  def new
    params[:address_use] ||= {}
    @address_use = AddressUse.new params[:address_use]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @address_use }
    end
  end

  def edit
    @address_use = AddressUse.find params[:id]
  end

  def create
    @address_use = AddressUse.new params[:address_use]

    respond_to do |format|
      if @address_use.save
        flash[:notice] = 'AddressUse was successfully created.'
        format.html { redirect_to @address_use }
        format.xml  { render :xml => @address_use, :status => :created, :location => @address_use }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @address_use.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @address_use = AddressUse.find params[:id]

    respond_to do |format|
      if @address_use.update_attributes params[:address_use]
        flash[:notice] = 'AddressUse was successfully updated.'
        format.html { redirect_to @address_use }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @address_use.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @address_use = AddressUse.find params[:id]
    @address_use.destroy

    respond_to do |format|
      format.html { redirect_to address_uses_url }
      format.xml  { head :ok }
    end
  end
end
