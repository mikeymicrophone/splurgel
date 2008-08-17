class StoresController < ApplicationController
  def index
    @stores = Store.find :all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stores }
    end
  end

  def show
    @store = Store.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @store }
    end
  end

  def new
    @store = Store.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @store }
    end
  end

  def edit
    @store = Store.find params[:id]
  end

  def create
    @store = Store.new params[:store]

    # if they uploaded an image, it becomes the store's primary image
    @image = Image.create(params[:image]) if params[:image] && params[:image][:uploaded_data] && params[:image][:uploaded_data] != ''
    params[:store][:primary_image_id] = @image.id
    
    respond_to do |format|
      if @store.save
        @store.uses_phone params[:phone][:number] if params[:phone]
        @store.uses_site params[:website][:url] if params[:website]
        flash[:notice] = 'Store was successfully created.'
        format.html { redirect_to @store }
        format.xml  { render :xml => @store, :status => :created, :location => @store }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @store.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @store = Store.find params[:id]

    respond_to do |format|
      if @store.update_attributes params[:store]
        flash[:notice] = 'Store was successfully updated.'
        format.html { redirect_to @store }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @store.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @store = Store.find params[:id]
    @store.destroy

    respond_to do |format|
      format.html { redirect_to stores_url }
      format.xml  { head :ok }
    end
  end
end
