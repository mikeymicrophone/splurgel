class ProductsController < ApplicationController
    
  def index
    @products = if params[:brand_id]
      if params[:location_id]
        Location.find(params[:location_id]).products.find(:all, :conditions => {:brand_id => params[:brand_id]})
      else
        Product.find(:all, :conditions => {:brand_id => params[:brand_id]})
      end
    elsif params[:location_id]
      Location.find(params[:location_id]).products
    else
      Product.find :all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  def show
    @product = Product.find params[:id]

    if params[:location_id]
      @offering = Offering.find_by_location_id_and_product_id(params[:location_id], params[:id])
      @price = @offering.price if @offering
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  def new
    params[:product] ||= {}
    if params[:brand_id]
      params[:product][:brand_id] = params[:brand_id]
    end
    @product = Product.new params[:product]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  def edit
    @product = Product.find params[:id]
  end

  def create
    unless params[:brand].blank? || params[:brand][:name].blank?
      @brand = Brand.find_or_create_by_name params[:brand][:name]
    end
    
    params[:product][:brand_id] = @brand.id if @brand
    
    @product = Product.new params[:product]

    respond_to do |format|
      if @product.save
        flash[:notice] = 'Product was successfully created.'
        format.html { redirect_to @product }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @product = Product.find params[:id]

    respond_to do |format|
      if @product.update_attributes params[:product]
        flash[:notice] = 'Product was successfully updated.'
        format.html { redirect_to @product }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @product = Product.find params[:id]
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.xml  { head :ok }
    end
  end
end
