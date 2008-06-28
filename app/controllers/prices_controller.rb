class PricesController < ApplicationController
  def index
    @prices = Price.find :all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prices }
    end
  end

  def show
    @price = Price.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @price }
    end
  end

  def new
    @price = Price.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @price }
    end
  end

  def edit
    @price = Price.find params[:id]
  end

  def create
    @price = Price.new params[:price]

    respond_to do |format|
      if @price.save
        flash[:notice] = 'Price was successfully created.'
        format.html { redirect_to @price }
        format.xml  { render :xml => @price, :status => :created, :location => @price }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @price.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @price = Price.find params[:id]

    respond_to do |format|
      if @price.update_attributes params[:price]
        flash[:notice] = 'Price was successfully updated.'
        format.html { redirect_to @price }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @price.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @price = Price.find params[:id]
    @price.destroy

    respond_to do |format|
      format.html { redirect_to prices_url }
      format.xml  { head :ok }
    end
  end
end
