class StocksController < ApplicationController
  def index
    @stocks = Stock.find :all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stocks }
    end
  end

  def show
    @stock = Stock.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stock }
    end
  end

  def new
    @stock = Stock.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stock }
    end
  end

  def edit
    @stock = Stock.find params[:id]
  end

  def create
    params[:how] ||= {}; params[:how][:many] = 1 if params[:how][:many].blank?
    params[:how][:many].to_i.times { @stock = Stock.create params[:stock] }

    respond_to do |format|
      if @stock.save
        flash[:notice] = 'Stock was successfully created.'
        format.html { redirect_to @stock }
        format.xml  { render :xml => @stock, :status => :created, :location => @stock }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stock.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @stock = Stock.find params[:id]

    respond_to do |format|
      if @stock.update_attributes params[:stock]
        flash[:notice] = 'Stock was successfully updated.'
        format.html { redirect_to @stock }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stock.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @stock = Stock.find params[:id]
    @stock.destroy

    respond_to do |format|
      format.html { redirect_to stocks_url }
      format.xml  { head :ok }
    end
  end
end
