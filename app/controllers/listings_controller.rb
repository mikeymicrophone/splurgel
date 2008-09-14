class ListingsController < ApplicationController
  def show_list
    @listed_items = Listing.all :conditions => {:user_id => params[:id], :list_type => params[:list_type]}
    @listed_items.reject &:private?
  end
  
  def index
    @listings = if params[:user_id]
      User.find(params[:user_id]).listings
    else
      Listing.find :all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @listings }
    end
  end

  def show
    @listing = Listing.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @listing }
    end
  end

  def new
    params[:listing] ||= {}
    @listing = Listing.new params[:listing]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @listing }
    end
  end

  def edit
    @listing = Listing.find params[:id]
  end

  def create
    @listing = Listing.new params[:listing]

    respond_to do |format|
      if @listing.save
        flash[:notice] = 'Listing was successfully created.'
        format.html { redirect_to @listing }
        format.xml  { render :xml => @listing, :status => :created, :location => @listing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @listing.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @listing = Listing.find params[:id]

    respond_to do |format|
      if @listing.update_attributes params[:listing]
        flash[:notice] = 'Listing was successfully updated.'
        format.html { redirect_to @listing }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @listing.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @listing = Listing.find params[:id]
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to listings_url }
      format.xml  { head :ok }
    end
  end
end
