class BrandsController < ApplicationController
  def index
    @brands = Brand.find :all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @brands }
    end
  end

  def show
    @brand = Brand.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @brand }
    end
  end

  def new
    params[:brand] ||= {}
    @brand = Brand.new params[:brand]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @brand }
    end
  end

  def edit
    @brand = Brand.find params[:id]
  end

  def create
    @brand = Brand.new params[:brand]

    respond_to do |format|
      if @brand.save
        flash[:notice] = 'Brand was successfully created.'
        format.html { redirect_to @brand }
        format.xml  { render :xml => @brand, :status => :created, :location => @brand }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @brand.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @brand = Brand.find params[:id]

    respond_to do |format|
      if @brand.update_attributes params[:brand]
        flash[:notice] = 'Brand was successfully updated.'
        format.html { redirect_to @brand }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @brand.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @brand = Brand.find params[:id]
    @brand.destroy

    respond_to do |format|
      format.html { redirect_to brands_url }
      format.xml  { head :ok }
    end
  end
end
