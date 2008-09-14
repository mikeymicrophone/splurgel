class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.find :all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @purchases }
    end
  end

  def show
    @purchase = Purchase.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @purchase }
    end
  end

  def new
    params[:purchase] ||= {}
    @purchase = Purchase.new params[:purchase]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @purchase }
    end
  end

  def edit
    @purchase = Purchase.find params[:id]
  end

  def create
    @purchase = Purchase.new params[:purchase]

    respond_to do |format|
      if @purchase.save
        flash[:notice] = 'Purchase was successfully created.'
        format.html { redirect_to @purchase }
        format.xml  { render :xml => @purchase, :status => :created, :location => @purchase }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @purchase.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @purchase = Purchase.find params[:id]

    respond_to do |format|
      if @purchase.update_attributes params[:purchase]
        flash[:notice] = 'Purchase was successfully updated.'
        format.html { redirect_to @purchase }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @purchase.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @purchase = Purchase.find params[:id]
    @purchase.destroy

    respond_to do |format|
      format.html { redirect_to purchases_url }
      format.xml  { head :ok }
    end
  end
end
